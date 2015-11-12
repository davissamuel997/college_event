class EventType < ActiveRecord::Base

	belongs_to :university

	def get_params
		{
			event_type_id: id,
			name:          name,
			description:   description,
			university_id: university_id
		}
	end

	def self.get_event_types(options = {})
		data = {:errors => false}

    if options[:university_id].present? && options[:university_id].to_i > 0
  		data[:event_types] = EventType.find_by_sql("
  																									SELECT event_types.* FROM event_types
                                                    WHERE university_id = #{options[:university_id]}
  																									ORDER BY name ASC
  																								 ").map { |event_type| event_type.get_params }
    else
      data[:errors] = true
    end

		data
	end

end
