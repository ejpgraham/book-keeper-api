class Publisher < ApplicationRecord
  has_many :books
  has_many :book_inventories, through: :books
  validates_presence_of :name
end
