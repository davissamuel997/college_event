class Organization < ActiveRecord::Base

  has_many :organization_users
	has_many :users, through: :organization_users

	belongs_to :organization_type
	belongs_to :university

  validates_presence_of :name
	validates_uniqueness_of :name, scope: :university_id

	validates_presence_of :organization_type_id
	validates_presence_of :university_id

	def get_params
		{
			organization_id:   id,
			name:              name,
			organization_type: organization_type.try(:name),
			description:       description
			events:            events.order('created_at DESC').map{ |event| event.get_params }
		}
	end

	def self.get_organizations(options = {})
		data = {:errors => false}

		data[:organizations] = Organization.find_by_sql("
																									SELECT organizations.* FROM organizations 
																									ORDER BY name ASC
																								 ").map { |organization| organization.get_params }

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

end
