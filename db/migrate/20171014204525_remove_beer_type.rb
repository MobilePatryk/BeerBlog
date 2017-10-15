class RemoveBeerType < ActiveRecord::Migration[5.1]
  def change
  end
  def down
  	drop_table :beer_types
  end
end
