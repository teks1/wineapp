class Wine < ActiveRecord::Base
	has_many :ratings, dependent: :destroy
	belongs_to :style

	def self.sql_find_all
		Wine.find_by_sql "SELECT wines.wine_id, wines.name as name, wines.country, wines.year, styles.name as style_name FROM wines JOIN styles ON wines.style_id = styles.style_id"
	end

	def self.sql_find_by_id(id)
		Wine.find_by_sql(["SELECT wines.wine_id, wines.name as name, wines.country, wines.year, styles.name as style_name, styles.style_id as style_id FROM wines JOIN styles ON wines.style_id = styles.style_id WHERE wine_id = ?", id]).first
	end

	def self.sql_find_by_name(wine_name)
		Wine.find_by_sql(["SELECT name FROM wines WHERE name = ?", wine_name]).first
	end

	def sql_delete
		Rating.find_by_sql ["DELETE FROM ratings WHERE wine_id = ?", self.id]
		Wine.find_by_sql ["DELETE FROM wines WHERE wine_id = ?", self.id]
	end

	def self.sql_create(params)
		Wine.find_by_sql ["INSERT INTO wines (name, style_id, country, year) VALUES (?, ?, ?, ?)", params[:name], params[:style_id], params[:country], params[:year]]
	end

	def sql_update(params)
		Wine.find_by_sql ["UPDATE wines SET name = ?, style_id = ?, country = ?, year = ? WHERE wine_id = ?", params[:name], params[:style_id], params[:country], params[:year], self.id]
	end

	def self.validate_wine_name_to_be_unique(wine_name, current_wine="")
		wine = sql_find_by_name(wine_name)
		if wine.nil?
			true
		elsif wine.present?
			if wine[:name] == current_wine
				true
			else
				false
			end
		end
	end

	def average_rating
		ratings.average(:rating)
	end

end
