class Store < ActiveRecord::Base
  attr_accessible :address, :name

  validates_presence_of :name

  has_many :articles
end
