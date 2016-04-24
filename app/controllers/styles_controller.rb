class StylesController < ActionController::Base
	
	before_action :ensure_that_user_is_admin, except: [:index]

	def index
		@styles = Style.sql_find_all
	end

	def edit
	end

end
