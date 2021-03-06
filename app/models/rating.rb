class Rating < ActiveRecord::Base
	belongs_to :wine
	belongs_to :user

	def self.sql_find_all
		Rating.find_by_sql "SELECT ratings.rating_id, ratings.rating, wines.name AS wine_name FROM ratings JOIN wines ON ratings.wine_id = wines.wine_id"
	end

	def self.sql_find_by_id(id)
		Rating.find_by_sql(["SELECT * FROM ratings WHERE rating_id = ?", id]).first
	end

	def self.sql_find_by_user_id(user_id)
		Rating.find_by_sql ["SELECT * FROM ratings where user_id = ?", user_id]	
	end

	def self.sql_find_by_wine_id(wine_id)
		Rating.find_by_sql ["SELECT * FROM ratings where wine_id = ?", wine_id]
	end

	def self.sql_create(user_id, params)
		Rating.find_by_sql ["INSERT INTO ratings (rating, user_id, wine_id) VALUES (?, ?, ?)", params[:rating], user_id, params[:wine_id]]
	end

	def sql_delete
		Rating.find_by_sql ["DELETE FROM ratings WHERE rating_id = ?", self.id]
	end

end
