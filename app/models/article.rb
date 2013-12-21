class Article < ActiveRecord::Base
  attr_accessible :description, :name, :price, :store_id, :total_in_shelf, :total_in_vault

  validates_presence_of :name, :store_id

  belongs_to :store
end
