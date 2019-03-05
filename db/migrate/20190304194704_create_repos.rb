class CreateRepos < ActiveRecord::Migration[5.0]
  def change
    create_table :repos do |t|
      t.string :project_name
      t.text :description
      t.string :repo_url
    end
  end
end
