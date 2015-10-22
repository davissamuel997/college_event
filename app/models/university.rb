class University < ActiveRecord::Base

	has_many :events, :dependent => :destroy

	def self.get_universities(options = {})
		data = {:errors => false}

		data[:universities] = University.find_by_sql("
																									SELECT universities.* FROM universities 
																									ORDER BY name ASC
																								 ")

		data
	end

end
