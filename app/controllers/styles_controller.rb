class StylesController < ActionController::Base
	before_action :ensure_that_user_is_admin, except: [:index]
end
