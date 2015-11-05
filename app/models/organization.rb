class Organization < ActiveRecord::Base

  has_many :organization_users
	has_many :users, through: :organization_users

	belongs_to :organization_type

	def self.get_organizations(options = {})
		data = {:errors => false}

		data[:organizations] = Organization.find_by_sql("
																									SELECT organizations.* FROM organizations 
																									ORDER BY name ASC
																								 ")

		data
	end

end
