class User < ActiveRecord::Base
	has_many :ratings, dependent: :destroy

	def self.sql_find_all
		User.find_by_sql "SELECT * FROM users"
	end

	def self.sql_find_by_id(id)
		User.find_by_sql("SELECT * FROM users WHERE user_id = #{id}").first
	end

	def self.sql_delete(id)
		Rating.find_by_sql "DELETE FROM ratings WHERE user_id = #{id}"
		User.find_by_sql "DELETE FROM users WHERE user_id = #{id}"
	end

	def self.sql_create(params)
		password_salt = BCrypt::Engine.generate_salt
		password_hash = BCrypt::Engine.hash_secret(params[:password], password_salt)
		User.find_by_sql "INSERT INTO users (username, password, password_salt) VALUES ('#{params[:username]}', '#{password_hash}', '#{password_salt}')"
	end

	def self.sql_update(id, params)
		password_salt = BCrypt::Engine.generate_salt
		password_hash = BCrypt::Engine.hash_secret(params[:password], password_salt)
		User.find_by_sql "UPDATE users SET username = '#{params[:username]}', password = '#{password_hash}', password_salt = '#{password_salt}' WHERE user_id = #{id}"
	end

	def self.sql_find_by_username(username)
		User.find_by_sql("SELECT * FROM users WHERE username = '#{username}'").first
	end

	def self.authenticate(username, password)
		user = sql_find_by_username(username)
		password_salt = user.password_salt
		user.password == BCrypt::Engine.hash_secret(password, password_salt)
	end

	def self.validate_parameters(params)
		params[:username].present? && params[:password].present? && sql_find_by_username(params[:username]).nil?

	end

	def self.validate_password_length(password)
		password.lenght < 9
	end

end
