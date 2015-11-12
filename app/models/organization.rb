class Organization < ActiveRecord::Base

  has_many :organization_users
	has_many :users, through: :organization_users

	has_many :events

	belongs_to :organization_type
	belongs_to :university

  validates_presence_of :name
	validates_uniqueness_of :name, scope: :university_id

	validates_presence_of :organization_type_id
	validates_presence_of :university_id

	after_create :add_user_to_organization

	def add_user_to_organization
		if admin_id && admin_id > 0
			user = User.find(admin_id)

			users << user

			self.save
		end
	end

	def get_params(current_user = nil)
		{
			organization_id:      id,
			admin_id:             admin_id,
			admin_name:           get_admin_name,
			user_is_member:       users.include?(current_user),
			user_count:           users.count,
			name:                 name,
			university_id:        university_id,
			university_name:      university.try(:name),
			organization_type_id: organization_type_id,
			organization_type:    organization_type.try(:name),
			description:          description,
			is_active:            is_active,
			events:               events.order('date DESC').map{ |event| event.get_params }
		}
	end

	def get_admin_name
		if admin_id && admin_id > 0
			admin_name = User.find(admin_id).try(:full_name)
		else
			admin_name = nil
		end

		admin_name
	end

	def self.get_organizations(options = {})
		data = {:errors => false}

		data[:organizations] = Organization.find_by_sql("
																									SELECT organizations.* FROM organizations 
																									ORDER BY name ASC
																								 ").map { |organization| organization.get_params(options[:current_user]) }

		data
	end

	def self.get_organization(options = {})
		data = {:errors => false}

		if options[:organization_id].present? && options[:organization_id].to_i > 0
			organization = Organization.find(options[:organization_id])

			data[:organization] = organization.get_params
		else
			data[:errors] = true
		end

		data
	end

	def self.join_organization(options = {})
		data = {:errors => false}

		if options[:user_id].present? && options[:user_id].to_i > 0 && options[:organization_id].present? && options[:organization_id].to_i > 0
			organization = Organization.find(options[:organization_id])

			user = User.find(options[:user_id])

			organization.users << user

			if organization.save
				data[:organization] = organization.get_params
			else
				data[:errors] = true
			end
		else
			data[:errors] = true
		end

		data
	end

end
