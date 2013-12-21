class AddStoreRefToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :store_id, :integer
  end
end
