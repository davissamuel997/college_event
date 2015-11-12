class University < ActiveRecord::Base

	has_many :events, :dependent => :destroy

	has_many :organizations

	has_many :event_types

	has_many :organization_types

  validates_presence_of :name

  belongs_to :user

  after_create :set_university_id

  def set_university_id
  	if user.present? && user.is_a?(User)
  		user.update(university_id: id)
  	end
  end

	def get_params
		{
			university_id:  id,
			name:           name,
			description:    description,
			user_id:        user_id,
			user_full_name: user.try(:full_name)          
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
