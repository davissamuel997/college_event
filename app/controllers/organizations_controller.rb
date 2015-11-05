class OrganizationsController < ApplicationController

  respond_to :json, :html

  before_filter :set_organization, :only => [:show, :edit, :update, :destroy]

	def index
	end

	def show
	end

	def new
		@organization = University.new
	end

	def create
		@organization = Organization.new(organization_params)

		if @organization.save
			redirect_to organizations_path
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @organization.present? && @organization.is_a?(Organization) && @organization.update(organization_params)
			redirect_to organizations_path
		else
			render :edit
		end
	end

	def destroy
		@organization.destroy

		redirect_to organizations_path
	end

	# /get_organizations
	def get_organizations
		response = University.get_organizations(params)

		respond_with response
	end

  def organization_params
    params.require(:organization).permit(:name, :organization_type_id)
  end

  def set_organization
		@organization = Organization.find(params[:id])
  end

  private :organization_params, :set_organization
end
