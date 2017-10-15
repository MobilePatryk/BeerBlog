class DropBeerTypes < ActiveRecord::Migration[5.1]
  def change
  	drop_table :beer_types
  end
end
