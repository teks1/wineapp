class User < ActiveRecord::Base
	has_many :ratings, dependent: :destroy

	def self.sql_find_all
		User.find_by_sql "SELECT * FROM users"
	end

	def self.sql_find_by_id(id)
		User.find_by_sql(["SELECT * FROM users WHERE user_id = ?", id]).first
	end

	def sql_delete
		Rating.find_by_sql ["DELETE FROM ratings WHERE user_id = ?", self.id]
		User.find_by_sql ["DELETE FROM users WHERE user_id = ?", self.id]
	end

	def self.sql_create(params)
		password_salt = BCrypt::Engine.generate_salt
		password_hash = BCrypt::Engine.hash_secret(params[:password], password_salt)
		User.find_by_sql ["INSERT INTO users (username, password, password_salt) VALUES (?, ?, ?)", params[:username], password_hash, password_salt]
	end

	def sql_update(params)
		password_salt = BCrypt::Engine.generate_salt
		password_hash = BCrypt::Engine.hash_secret(params[:password], password_salt)
		User.find_by_sql ["UPDATE users SET username = ?, password = ?, password_salt = ? WHERE user_id = ?", params[:username], password_hash, password_salt, self.id]
	end

	def self.sql_find_by_username(username)
		User.find_by_sql(["SELECT * FROM users WHERE username = ?", username]).first
	end

	def self.authenticate(username, password)
		user = sql_find_by_username(username)
		password_salt = user.password_salt
		user.password == BCrypt::Engine.hash_secret(password, password_salt)
	end

	def self.validate_username_to_be_unique(username, current_username="")
		user = sql_find_by_username(username)
		if user.nil?
			true
		elsif user.present?
			if user[:username] == current_username
				true
			else
				false
			end
		end
	end

end
