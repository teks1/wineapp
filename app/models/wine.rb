class Wine < ActiveRecord::Base
	has_many :ratings, dependent: :destroy
	belongs_to :style

	def self.sql_find_all
		Wine.find_by_sql "SELECT * FROM wines"
	end

	def self.sql_find_by_id(id)
		Wine.find_by_sql("SELECT * FROM wines WHERE wine_id = #{id}").first
	end

	def self.sql_delete(id)
		Rating.find_by_sql "DELETE FROM ratings WHERE wine_id = #{id}"
		Wine.find_by_sql "DELETE FROM wines WHERE wine_id = #{id}"
	end

	def self.sql_create(params)
		Wine.find_by_sql "INSERT INTO wines (name, style_id, country, year) VALUES ('#{params[:name]}', #{params[:style_id]}, '#{params[:country]}', #{params[:year]})"
	end

	def self.sql_update(id, params)
		Wine.find_by_sql "UPDATE wines SET name = '#{params[:name]}', style_id = #{params[:style]}, country = '#{params[:country]}', year = #{params[:year]} WHERE wine_id = #{id}"
	end

	def self.validate_parameters(params)
		params[:name].present?
	end

	def average_rating
		ratings.average(:rating)
	end

end
