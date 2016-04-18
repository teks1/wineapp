class EditUsersPasswordColumn < ActiveRecord::Migration
  def change
  	execute "ALTER TABLE users DROP COLUMN password_digest"
  	execute "ALTER TABLE users ADD password VARCHAR (64) NOT NULL"
  	execute "ALTER TABLE users ADD password_salt VARCHAR (64) NOT NULL"
  end
end
