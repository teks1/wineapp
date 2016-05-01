class DropOldStyleFromWines < ActiveRecord::Migration
  def change
  	execute "ALTER TABLE wines DROP COLUMN style"
  end
end
