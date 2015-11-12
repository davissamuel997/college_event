class EventStatusesController < ApplicationController

  respond_to :json, :html

  before_filter :set_event_status, :only => [:show, :edit, :update, :destroy]

	def index
		@event_statuses = EventStatus.all.order('name ASC')
	end

	def show
	end

	def new
		@event_status = EventStatus.new

		@university_id = current_user.university_id
	end

	def create
		@event_status = EventStatus.new(event_status_params)

		if @event_status.save
			redirect_to event_statuses_path
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @event_status.present? && @event_status.is_a?(EventStatus) && @organization_type.update(event_status_params)
			redirect_to event_statuses_path
		else
			render :edit
		end
	end

	def destroy
		@event_status.destroy

		redirect_to event_statuses_path
	end

	# /get_organizations
	def get_event_statuses
		params[:university_id] = current_user.try(:university_id)

		response = EventStatus.get_event_statuses(params)

		respond_with response
	end

  def event_status_params
    params.require(:event_status).permit(:name, :description, :university_id)
  end

  def set_event_status
		@event_status = EventStatus.find(params[:id])
  end

  private :event_status_params, :set_event_status
end
