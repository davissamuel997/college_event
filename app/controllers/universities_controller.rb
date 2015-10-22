class UniversitiesController < ApplicationController

  respond_to :json, :html

	def welcome
	end

	# /get_universities
	def get_universities
		response = University.get_universities(params)

		respond_with response
	end

  def university_params
    params.require(:university).permit(:name, :description)
  end

  private :university_params
end
