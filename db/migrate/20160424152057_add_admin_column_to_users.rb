class AddAdminColumnToUsers < ActiveRecord::Migration
  def change
  	execute "ALTER TABLE users ADD COLUMN admin BOOLEAN DEFAULT false"
  end
end
