class CreateStylesTable < ActiveRecord::Migration
  def change
    execute "CREATE TABLE styles(
    	style_id serial PRIMARY KEY,
    	style VARCHAR (32) UNIQUE NOT NULL,
    	description text DEFAULT 'No description yet'
    	);"
  end
end
