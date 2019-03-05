class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :mod
      t.string :github_username
      t.string :profile_url
    end
  end
end
