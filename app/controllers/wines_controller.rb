class WinesController < ApplicationController

	def index
		@wines = Wine.find_by_sql "SELECT * FROM wines"
	end

	def show
		@wine = Wine.find_by_sql ["SELECT * FROM wines WHERE wine_id = #{params[:id]}"]
	end

	def new 
		@wine = Wine.new
		@styles = ["Red wine", "White wine", "Rose wine", "Sparkling wine", "Champagne", "Desert wine"]
	end

	def edit
	end

	def create
	end

	def update
	end

	def destroy
		Wine.find_by_sql ["DELETE FROM wines WHERE wine_id = #{params[:id]}"]
		redirect_to wines_path, notice: "Wine deleted"
	end

end
