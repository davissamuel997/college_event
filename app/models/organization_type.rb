class OrganizationType < ActiveRecord::Base

  has_many :organizations

	def self.get_organization_types(options = {})
		data = {:errors => false}

		data[:organization_types] = OrganizationType.find_by_sql("
																									SELECT organization_types.* FROM organization_types 
																									ORDER BY name ASC
																								 ")

		data
	end

end
