class Wine < ActiveRecord::Base
	has_many :ratings, dependent: :destroy

	def self.sql_find_all
		Wine.find_by_sql "SELECT * FROM wines"
	end

	def self.sql_find_by_id(id)
		Wine.find_by_sql "SELECT * FROM wines WHERE wine_id = #{id}"
	end

	def self.sql_delete(id)
		Wine.find_by_sql "DELETE FROM wines WHERE wine_id = #{id}"
	end

	def self.sql_create(params)
		Wine.find_by_sql "INSERT INTO wines (name, style, country, year) VALUES ('#{params[:name]}', '#{params[:style]}', '#{params[:country]}', #{params[:year]})"
	end

	def self.sql_update(id, params)
		Wine.find_by_sql "UPDATE wines SET name = '#{params[:name]}', style = '#{params[:style]}', country = '#{params[:country]}',year = #{params[:year]} WHERE wine_id = #{id}"
	end

end
