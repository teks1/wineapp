class StylesController < ApplicationController
	
	before_action :ensure_that_user_is_admin
	before_action :set_style, only: [:edit]

	def index
		@styles = Style.sql_find_all
	end

	def edit
	end

	def update
	end

	private

	def set_style
		@style = Style.sql_find_by_id(params[:id])
	end

end
