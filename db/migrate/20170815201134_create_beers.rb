class CreateBeers < ActiveRecord::Migration[5.1]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :type
      t.string :country
      t.float :price

      t.timestamps
    end
  end
end
