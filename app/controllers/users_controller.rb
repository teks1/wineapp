class UsersController < ApplicationController
	
	before_action :set_user, only: [:edit, :show, :update, :destroy]
	before_action :ensure_that_user_signed_in, except: [:new, :create]
	before_action :ensure_that_user_is_admin, only: [:destroy, :index]
	before_action :ensure_that_current_user_or_admin_sees_own_page, only: [:show, :edit]

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
		#I don't shout empty fields or short password error here, because view checks it, 
		#but I still double check it here so there is no way illegal values get to the database
		if validate_fields_for_not_being_empty_or_password_being_too_short && User.validate_username_to_be_unique(user_params[:username])
			User.sql_create(user_params)
			redirect_to :root, notice: "Account was created"
		else
			redirect_to :back, notice: "Username is taken"
		end
	end

	def update
		if validate_fields_for_not_being_empty_or_password_being_too_short && User.validate_username_to_be_unique(user_params[:username], current_user.username)
			@user.sql_update(user_params)
			redirect_to user_path, notice: "Account was edited"
		else
			redirect_to :back, notice: "Username is taken"
		end
	end

	def destroy
		#only admin can delete users and we don't want admin to delete himself
		if current_user[:id] == params[:id].to_i
			redirect_to :back, notice: "Don't delete admin-user"
		else
			@user.sql_delete
			redirect_to users_path, notice: "User was deleted"
		end		
	end

	private

	def set_user
		@user = User.sql_find_by_id(params[:id])
	end

	def user_params
		params.require(:user).permit(:username, :password)
	end

	def ensure_that_current_user_or_admin_sees_own_page
		redirect_to :root unless current_user.id == params[:id].to_i || admin_user
	end

	def validate_fields_for_not_being_empty_or_password_being_too_short
		user_params[:username].present? && user_params[:password].present? && user_params[:password].length > 8
	end

end
