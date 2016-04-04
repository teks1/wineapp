class CreateRatingsTable < ActiveRecord::Migration
  def change
    execute "CREATE TABLE ratings(
    rating_id serial PRIMARY KEY,
    rating INT NOT NULL,
    user_id INT references users(user_id),
    wine_id INT references wines(wine_id)
    );"
  end
end
