class AddPasswordColumnToUsers < ActiveRecord::Migration
  def change
  	execute "ALTER TABLE users ADD password_digest VARCHAR (255) NOT NULL"
  end
end
