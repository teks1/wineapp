class StylesController < ApplicationController
	
	before_action :ensure_that_user_is_admin
	before_action :set_style, only: [:edit, :update]

	def index
		@styles = Style.sql_find_all
	end

	def edit
	end

	def update
		if style_params[:name].present?
			@style.sql_update(style_params)
			redirect_to styles_path, notice: "Style was edited"
		else
			redirect_to :back, notice: "Don't leave style name blank"
		end
	end

	private

	def set_style
		@style = Style.sql_find_by_id(params[:id])
	end

	def style_params
		params.require(:style).permit(:name, :description)
	end

end
