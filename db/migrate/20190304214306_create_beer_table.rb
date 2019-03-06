class CreateBeerTable < ActiveRecord::Migration[5.0]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :style
      t.string :description
      end
    end
end
