class ChangePriceTypeForBeers < ActiveRecord::Migration[5.1]
  def change
  	change_column :beers, :price, :decimal, precision: 5, scale: 2
  end
end
