class CreateFavoritesTabele < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :beer_id
      t.boolean :is_favorite
      t.boolean :trying
    end
  end
end
