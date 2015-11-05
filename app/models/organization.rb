class Organization < ActiveRecord::Base

  has_many :organization_users
	has_many :users, through: :organization_users

	belongs_to :organization_type

	def get_params
		{
			organization_id:   id,
			name:              name,
			organization_type: organization_type.try(:name),
			description:       description

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

end
