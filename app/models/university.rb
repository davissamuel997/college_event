class University < ActiveRecord::Base

	has_many :events, :dependent => :destroy

	has_many :organizations

	has_many :event_types

	has_many :event_statuses

	has_many :organization_types

  validates_presence_of :name

  has_many :users

	def get_params
		{
			university_id:  id,
			name:           name,
			description:    description,
			user_id:        user_id,
			user_full_name: get_user.try(:full_name)      
		}
	end

	def get_user
		if user_id && user_id > 0
			user = User.find(user_id)
		else
			user = nil
		end

		user
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
