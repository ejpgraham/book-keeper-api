class Store < ApplicationRecord
  validates_presence_of :name
  has_many :book_inventories
  has_many :books, through: :book_inventories
end
