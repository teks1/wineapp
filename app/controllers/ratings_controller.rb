class RatingsController < ApplicationController

	before_action :set_rating, only: [:destroy]
	before_action :ensure_that_user_signed_in, except: [:index]
	before_action :ensure_that_user_is_admin, only: [:destroy]
	
	def index
		@ratings = Rating.sql_find_all
	end
	
	def new
		@rating = Rating.new
		@wines = Wine.sql_find_all 
	end

	def create
		if validate_fields_for_not_being_empty && validate_rating_range_is_correct
			@rating = Rating.sql_create(current_user.id, rating_params)
			redirect_to ratings_path, notice: "Rating was created"
		else
			redirect_to :back, notice: "Rating must be between 0-100"
		end
	end

	def destroy
		@rating.sql_delete
		redirect_to ratings_path, notice: "Rating was deleted"
	end

	private

	def set_rating
		@rating = Rating.sql_find_by_id(params[:id])
	end

	def rating_params
		params.require(:rating).permit(:rating, :wine_id)
	end

	def validate_fields_for_not_being_empty
		rating_params[:rating].present? && rating_params[:wine_id].present?
	end

	def validate_rating_range_is_correct
		rating_params[:rating].to_i.between?(0,100)
	end

end
