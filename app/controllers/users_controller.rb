class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :show, :update, :destroy]
	before_action :ensure_that_user_signed_in, except: [:new, :create]

	def index
		@users = User.sql_find_all
	end

	def show
		@ratings = Rating.sql_find_by_user_id(params[:id])
	end

	def new 
		@user = User.new
	end

	def edit
	end

	def create
		if User.validate_parameters(user_params)
			@user = User.sql_create(user_params)
			redirect_to :root, notice: "Account was created"
		else
			redirect_to :back, notice: "Username and/or password can't be empty"
		end
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
