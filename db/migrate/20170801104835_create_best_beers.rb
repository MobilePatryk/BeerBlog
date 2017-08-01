class CreateBestBeers < ActiveRecord::Migration[5.1]
  def change
    create_table :best_beers do |t|
      t.string :beer
      t.float :alcohol
      t.integer :points
      t.string :beer_type

      t.timestamps
    end
  end
end
