class University < ActiveRecord::Base

	has_many :events, :dependent => :destroy

	def get_params
		{
			university_id: id,
			name:          name,
			description:   description
		}
	end

	def self.get_universities(options = {})
		data = {:errors => false}

		data[:universities] = University.find_by_sql("
																									SELECT universities.* FROM universities 
																									ORDER BY name ASC
																								 ").map { |university| University.get_params }

		data
	end

end
