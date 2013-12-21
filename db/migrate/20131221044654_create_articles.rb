class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.text :description
      t.float :price
      t.integer :total_in_shelf
      t.integer :total_in_vault

      t.timestamps
    end
  end
end
