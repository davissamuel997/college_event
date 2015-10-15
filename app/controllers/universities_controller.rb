class UniversitiesController < ApplicationController

  respond_to :json, :html

	def welcome
	end

  def university_params
    params.require(:university).permit(:name, :description)
  end

  private :university_params
end
