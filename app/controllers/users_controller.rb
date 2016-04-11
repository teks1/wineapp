class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :create, :update, :destroy]

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
	end

	def update
	end

	def destroy
	end

	private

	def set_user
		@user = User.sql_find_by_id(params[:id])
	end

	def user_params
		params.require(:user).permit(:name)
	end

end
