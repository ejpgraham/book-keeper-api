require 'rails_helper'

RSpec.describe BookInventory, type: :model do
  it { should belong_to(:store)}
  it { should belong_to(:book)}
end
