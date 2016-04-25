class ChangeColumnStyleStyle < ActiveRecord::Migration
  def change
  	execute "ALTER TABLE styles DROP style"
  	execute "ALTER TABLE styles ADD COLUMN name VARCHAR(32) NOT NULL"
  end
end
