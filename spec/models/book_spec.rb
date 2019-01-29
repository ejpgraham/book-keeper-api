require 'rails_helper'

RSpec.describe Book, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:author) }
  it { should belong_to(:publisher) }
  it { should have_many(:book_inventories)}
end
