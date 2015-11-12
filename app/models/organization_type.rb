class OrganizationType < ActiveRecord::Base

  has_many :organizations

  belongs_to :university

  def get_params
  	{
  		organization_type_id: id,
  		name:                 name,
  		description:          description,
  		university_id:        university_id
  	}
  end

	def self.get_organization_types(options = {})
		data = {:errors => false}

    if options[:university_id].present? && options[:university_id].to_i > 0
  		data[:organization_types] = OrganizationType.find_by_sql("
  																									SELECT organization_types.* FROM organization_types
                                                    WHERE university_id = #{options[:university_id]}
  																									ORDER BY name ASC
  																								 ").map { |organization_type| organization_type.get_params }
    else
      data[:errors] = true
    end

		data
	end

end
