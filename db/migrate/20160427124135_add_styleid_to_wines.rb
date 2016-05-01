class AddStyleidToWines < ActiveRecord::Migration
  def change
  	execute "ALTER TABLE wines ADD COLUMN style_id INT references styles(style_id)"
  end
end
