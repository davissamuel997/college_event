class EventType < ActiveRecord::Base

	belongs_to :university

	def get_params
		{
			event_type_id: event_type_id
			name:          name,
			university_id: university_id
		}
	end

end
