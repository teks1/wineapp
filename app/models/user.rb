class User < ActiveRecord::Base
	has_many :ratings, dependent: :destroy

	def self.sql_find_all
		Wine.find_by_sql "SELECT * FROM users"
	end

	def self.sql_find_by_id(id)
		Wine.find_by_sql "SELECT * FROM users WHERE user_id = #{id}"
	end

	def self.sql_delete(id)
		Wine.find_by_sql "DELETE FROM users WHERE user_id = #{id}"
	end

	def self.sql_create(params)
		Wine.find_by_sql "INSERT INTO users (username) VALUES ('#{params[:username]}')"
	end

	def self.sql_update(id, params)
		Wine.find_by_sql "UPDATE users SET username = '#{params[:username]}' WHERE user_id = #{id}"
	end

end
