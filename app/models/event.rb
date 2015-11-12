class Event < ActiveRecord::Base

	belongs_to :university

  has_many :comments, as: :commentable
  has_many :likes, as: :likeable

	def get_params
		{
			event_id:      id,
			name:          name,
			event_type_id: event_type_id,
			description:   description,
			start_time:    start_time,
			date:          date.present? ? date.strftime('%Y-%m-%d') : nil,
			contact_phone: contact_phone,
			contact_email: contact_email,
			university_id: university_id
		}
	end

end
