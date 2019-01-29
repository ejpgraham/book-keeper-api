class Book < ApplicationRecord
  belongs_to :publisher
  has_many :book_inventories
  validates_presence_of :title, :author
end
