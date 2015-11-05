class OrganizationTypesController < ApplicationController

  respond_to :json, :html

  before_filter :set_organization_type, :only => [:show, :edit, :update, :destroy]

	def index
	end

	def show
	end

	def new
		@organization = OrganizationType.new
	end

	def create
		@organization_type = OrganizationType.new(organization_type_params)

		if @organization_type.save
			redirect_to organization_types_path
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @organization_type.present? && @organization_type.is_a?(OrganizationType) && @organization_type.update(organization_type_params)
			redirect_to organization_types_path
		else
			render :edit
		end
	end

	def destroy
		@organization_type.destroy

		redirect_to organization_types_path
	end

	# /get_organizations
	def get_organization_types
		response = OrganizationType.organization_types(params)

		respond_with response
	end

  def organization_type_params
    params.require(:organization_type).permit(:name)
  end

  def set_organization_type
		@organization_type = OrganizationType.find(params[:id])
  end

  private :organization_type_params, :set_organization_type
end
