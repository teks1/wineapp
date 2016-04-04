class CreateWinesTable < ActiveRecord::Migration
  def change
    execute "CREATE TABLE wines(
    wine_id serial PRIMARY KEY,
    name VARCHAR (120) UNIQUE NOT NULL,
    style VARCHAR (60) NOT NULL,
    country VARCHAR (60) NOT NULL,
    year INT
    );"
  end
end
