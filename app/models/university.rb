class University < ActiveRecord::Base

	has_many :events, :dependent => :destroy

	has_many :organizations

	has_many :event_types

  validates_presence_of :name

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
																								 ").map { |university| university.get_params }

		data
	end

end
