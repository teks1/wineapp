class SessionsController < ApplicationController

	def new

	end

	def create
		@user = User.sql_find_by_username(params[:username])
		if @user && User.authenticate(params[:username], params[:password])
			session[:user_id] = @user.id
			redirect_to @user, notice: "Welcome back"
		else
			redirect_to :back, notice: "Username and/or password wrong"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to :root
	end

end
