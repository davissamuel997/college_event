class OrganizationUser < ActiveRecord::Base

	belongs_to :organization
	belongs_to :user

	after_create :check_make_active

	def check_make_active
		if organization.present? && organization.is_a?(Organization) && organization.users.present? && organization.users.count >= 2
			organization.update(is_active: true)
		end
	end

end
