class EventStatus < ActiveRecord::Base

  has_many :events

  belongs_to :university

  def get_params
  	{
  		organization_type_id: id,
  		name:                 name,
  		description:          description,
  		university_id:        university_id
  	}
  end

	def self.get_event_statuses(options = {})
		data = {:errors => false}

    if options[:university_id].present? && options[:university_id].to_i > 0
  		data[:event_statuses] = OrganizationType.find_by_sql("
          																									SELECT event_statuses.* FROM event_statuses
                                                            WHERE university_id = #{options[:university_id]}
          																									ORDER BY name ASC
          																								 ").map { |event_status| event_status.get_params }
    else
      data[:errors] = true
    end

		data
	end

end
