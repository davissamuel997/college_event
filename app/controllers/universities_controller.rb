class UniversitiesController < ApplicationController

  respond_to :json, :html

  before_filter :set_university, :only => [:show, :edit, :update, :destroy]

	def welcome
	end

	def index
	end

	def show
	end

	def new
		@university = University.new
	end

	def create
		@university = University.new(university_params)

		@university.user_id = current_user.try(:id)

		if @university.save
			redirect_to universities_path
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @university.present? && @university.is_a?(University) && @university.update(university_params)
			redirect_to universities_path
		else
			render :edit
		end
	end

	def destroy
		@university.destroy

		redirect_to universities_path
	end

	# /get_universities
	def get_universities
		response = University.get_universities(params)

		respond_with response
	end

  def university_params
    params.require(:university).permit(:name, :description)
  end

  def set_university
		@university = University.find(params[:id])
  end

  private :university_params, :set_university
end
