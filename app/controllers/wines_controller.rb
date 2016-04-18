class WinesController < ApplicationController
	before_action :set_wine, only: [:show, :edit, :update, :destroy]
	before_action :set_styles, only: [:new, :edit]
	before_action :set_countries, only: [:new, :edit]
	before_action :ensure_that_user_signed_in, except: [:index, :show]

	def index
		@wines = Wine.sql_find_all
	end

	def show
		
	end

	def new 
		@wine = Wine.new
	end

	def edit
		
	end

	def create
		if Wine.validate_parameters(wine_params)
			@wine = Wine.sql_create(wine_params)
			redirect_to wines_path, notice: "Wine was created"
		else
			redirect_to :back, notice: "Wine name was duplicate or empty or year was empty"
		end
	end

	def update
		if Wine.validate_parameters(wine_params)
			@wine = Wine.sql_update(params[:id], wine_params)		
			redirect_to wines_path, notice: "Wine was edited"
		else
			redirect_to :back, notice: "Wine name was duplicate or empty or year was empty"
		end
	end

	def destroy
		Wine.sql_delete(params[:id])
		redirect_to wines_path, notice: "Wine was deleted"
	end

	private

	def set_wine
		@wine = Wine.sql_find_by_id(params[:id])
	end

	def set_styles
		@styles = ["Red wine", "White wine", "Rose wine", "Sparkling wine", "Champagne", "Dessert wine"]
	end

	def set_countries
		@countries = ["Argentina", "Australia", "Chile", "France", "Germany", "Italy", "New Zealand", "Portugal", "Spain", "United States", "Other"]
	end

	def wine_params
		params.require(:wine).permit(:name, :style, :country, :year)
	end

end
