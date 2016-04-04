class CreateUserTable < ActiveRecord::Migration
  def change
    execute "CREATE TABLE users(
    user_id serial PRIMARY KEY,
    username VARCHAR (25) UNIQUE NOT NULL
    );"
  end
end
