class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :show, :update, :destroy]

	def index
		@users = User.sql_find_all
	end

	def show
	end

	def new 
		@user = User.new
	end

	def edit
	end

	def create
		@user = User.sql_create(user_params)
		redirect_to @user, notice: "Account was created"
	end

	def update
		@user = User.sql_update(params[:id], user_params)
		redirect_to user_path, notice: "Account was edited"
	end

	def destroy
		User.sql_delete(params[:id])
		redirect_to root_path, notice: "User was deleted"
	end

	private

	def set_user
		@user = User.sql_find_by_id(params[:id])
	end

	def user_params
		params.require(:user).permit(:username, :password)
	end

end
