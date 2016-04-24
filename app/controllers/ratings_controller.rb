class RatingsController < ApplicationController

	before_action :ensure_that_user_signed_in, except: [:index]
	
	def index
		@ratings = Rating.sql_find_all
	end
	
	def new
		@rating = Rating.new
		@wines = Wine.sql_find_all 
	end

	def create
		@rating = Rating.sql_create(current_user.id, rating_params)
		redirect_to ratings_path
	end

	def destroy
		Rating.sql_delete(params[:id])
		redirect_to ratings_path, notice: "Rating was deleted"
	end

	private

	def set_rating
		@rating = Rating.sql_find_by_id(params[:id])
	end

	def rating_params
		params.require(:rating).permit(:rating, :wine_id)
	end

end
