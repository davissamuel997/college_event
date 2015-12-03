class Event < ActiveRecord::Base

  geocoded_by :full_street_address
  after_validation :geocode

	belongs_to :university
	belongs_to :organization
	belongs_to :event_status
	belongs_to :event_type

  has_many :comments, as: :commentable
  has_many :likes, as: :likeable

  after_create :setup_event
  after_validation :create_full_address

  def setup_event
    self.create_full_address
  end

  def create_full_address
    unless self.try(:address).nil? || self.try(:postal_code).nil? || self.try(:state).nil?
      self.full_street_address = "#{self.address} #{self.city} #{self.state} #{self.postal_code}"

      coordinates = Geocoder.coordinates(self.full_street_address)

      if coordinates.present? && coordinates.count > 0
        self.latitude  = coordinates.first
        self.longitude = coordinates.last
      end
    end
  end

  def self.get_events(options = {})
  	data = {:errors => false}

  	user = options[:current_user]

  	if user.present? && user.is_a?(User)
      organization_ids   = user.organizations.map(&:id)
      private_status_ids = EventType.where(name: "Private").map(&:id)
      rso_status_ids     = EventType.where(name: "RSO").map(&:id)
      public_status_ids  = EventType.where(name: "Public").map(&:id)

      # SELECT "events".*
      # FROM "events" 
      # WHERE ((event_status_id IN (2) 
      #   AND university_id = 6) OR (event_status_id IN (3) 
      #   AND organization_id IN (5,6,7,12,13,14,15)) OR event_status_id IN (1))  
      # ORDER BY date DESC
  		data[:events]       = Event.where("(event_type_id IN (?) AND university_id = ?) OR (event_type_id IN (?) AND organization_id IN (?)) OR event_type_id IN (?)", private_status_ids, user.university_id, rso_status_ids, organization_ids, public_status_ids).order('date DESC').map{ |event| event.get_params }
      data[:current_user] = user.get_params
  	else
  		data[:errors] = true
  	end

  	data
  end

  def self.get_event_comments(options = {})
    data = {:errors => false}

    if options[:event_id].present? && options[:event_id].to_i > 0
      event = Event.find(options[:event_id])

      data[:comments] = event.comments.order('created_at ASC').map{ |comment| comment.get_params }
    else
      data[:errors] = true
    end

    data
  end

  def self.get_event_dropdowns(options = {})
  	data = {:errors => false}

  	if options[:organization_id].present? && options[:organization_id].to_i > 0
  		organization = Organization.find(options[:organization_id])

  		data[:event_statuses] = EventStatus.where(university_id: organization.university_id).order('name ASC').map{ |event_status| event_status.get_params }
  		data[:event_types]    = EventType.where(university_id: organization.university_id).order('name ASC').map{ |event_type| event_type.get_params }
  		data[:states]         = Carmen::Country.coded('US').subregions.map{ |state| state.name } 
  	else
  		data[:errors] = true
  	end

  	data
  end

  def self.get_countries(options = {})
    data = {:errors => false}

    if options[:campaign_id].present? && options[:campaign_id].to_i > 0
      campaign = Campaign.find(options[:campaign_id])

      data[:countries] = IsoCountryCodes.for_select.map { |country| {name: country[0], code: country[1]} if country[0].present? && country[1].present? }
    else
      data[:errors] = true
    end

    data
  end

  def self.create_event(options = {}, need_parse = false)
    data = {:errors => false}

    if options[:event_params].present?
      event_params = need_parse ? JSON.parse(options[:event_params]) : options[:event_params]

      event = Event.new(event_params)

      if event.save
        data[:event_id] = event.id
      else
        data[:errors] = true
      end
    else
      data[:errors] = true
    end

    data
  end

  def self.create_event_comment(options = {})
    data = {:errors => false}

    if options[:event_id].present? && options[:event_id].to_i > 0 && options[:comment_text].present? && options[:comment_text].size > 0 && options[:user_id].present? && options[:user_id].to_i > 0
      event = Event.find(options[:event_id])

      new_comment = event.comments.new(user_id: options[:user_id], text: options[:comment_text],
                                       rating:  options[:rating])

      if new_comment.save
        data[:comments] = event.comments.order('created_at ASC').map{ |comment| comment.get_params }
      else
        data[:errors] = true
      end
    else
      data[:errors] = true
    end

    data
  end

	def get_params
		{
			event_id:          id,
			name:              name,
			event_type_id:     event_type_id,
      event_type_name:   event_type.try(:name),
      event_status_id:   event_status_id,
      event_status_name: event_status.try(:name),
			description:       description,
			start_time:        start_time.present? ? start_time.strftime('%I:%M %p') : nil,
			date:              date.present? ? date.strftime('%Y-%m-%d') : nil,
			contact_phone:     contact_phone,
			contact_email:     contact_email,
			university_id:     university_id,
      end_time:          end_time,
      city:              city,
      state:             state,
      postal_code:       postal_code,
      latitude:          latitude,
      longitude:         longitude,
      organization_id:   organization_id,
      organization_name: organization.try(:name),
      comments:          self.comments.order('created_at ASC').map{ |comment| comment.get_params } 
		}
	end

end
