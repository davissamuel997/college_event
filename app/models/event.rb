class Event < ActiveRecord::Base

	belongs_to :university
	belongs_to :organization
	belongs_to :event_status
	belongs_to :event_type

  has_many :comments, as: :commentable
  has_many :likes, as: :likeable

  def self.get_events(options = {})
  	data = {:errors => false}

  	user = options[:current_user]

  	if user.present? && user.is_a?(User)
  		data[:events] = []
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

	def get_params
		{
			event_id:      id,
			name:          name,
			event_type_id: event_type_id,
			description:   description,
			start_time:    start_time,
			date:          date.present? ? date.strftime('%Y-%m-%d') : nil,
			contact_phone: contact_phone,
			contact_email: contact_email,
			university_id: university_id
		}
	end

end
