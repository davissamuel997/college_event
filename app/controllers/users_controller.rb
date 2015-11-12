class UsersController < ApplicationController

  before_filter :set_user, :only => [:show, :edit, :update, :destroy]

  respond_to :json, :html

	def welcome
	end

	def show
	end

	def edit
	end

	def update
		if @user.present? && @user.is_a?(User) && @user.update(user_params)
			redirect_to root_path
		else
			render :edit
		end
	end

	def destroy
		@user.destroy

		redirect_to root_path
	end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :role_ids)
  end

  def set_user
		@user = current_user
  end

  private :user_params, :set_user
end
