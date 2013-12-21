class Article < ActiveRecord::Base
  attr_accessible :description, :name, :price, :store, :total_in_shelf, :total_in_vault

  belongs_to :store
end
