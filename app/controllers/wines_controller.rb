class WinesController < ApplicationController
	
	before_action :set_wine, only: [:show, :edit, :update, :destroy]
	before_action :set_countries, only: [:new, :edit]
	before_action :set_years, only: [:new, :edit]
	before_action :set_styles_for_template, only: [:new, :edit]
	before_action :ensure_that_user_signed_in, except: [:index, :show]
	before_action :ensure_that_user_is_admin, only: [:destroy]

	def index
		@wines = Wine.sql_find_all
	end

	def show
		@ratings = Rating.sql_find_by_wine_id(params[:id])
	end

	def new 
		@wine = Wine.new
	end

	def edit
		
	end

	def create
		if validate_fields_for_not_being_empty && Wine.validate_wine_name_to_be_unique(wine_params[:name])
			@wine = Wine.sql_create(wine_params)
			redirect_to wines_path, notice: "Wine was created"
		else
			redirect_to :back, notice: "Wine name was duplicate"
		end
	end

	def update
		if validate_fields_for_not_being_empty && Wine.validate_wine_name_to_be_unique(wine_params[:name], @wine.name)
			@wine.sql_update(wine_params)
			redirect_to wines_path, notice: "Wine was edited"
		else
			redirect_to :back, notice: "Wine name was duplicate"
		end
	end

	def destroy
		@wine.sql_delete
		redirect_to wines_path, notice: "Wine was deleted"
	end

	private

	def set_wine
		@wine = Wine.sql_find_by_id(params[:id])
	end

	def set_countries
		@countries = ["Argentina", "Australia", "Chile", "France", "Germany", "Italy", "New Zealand", "Portugal", "Spain", "United States", "Other"]
	end

	def set_years
		@years = ["2001", "2002", "2003","2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "Unknown"]
	end

	def wine_params
		params.require(:wine).permit(:name, :style_id, :country, :year)
	end

	def set_styles_for_template
		@styles = Style.sql_find_all
	end

	def validate_fields_for_not_being_empty
		wine_params[:name].present?
	end

end
