require 'rails_helper'

RSpec.describe 'Publishers API', type: :request do
  let(:publisher) { create(:publisher_with_books) }
  let(:other_publisher) {create(:publisher_with_books)}
  let(:store) { create(:store) }
  let(:other_store) { create(:store) }

  describe "GET a list of stores carrying publisher's books" do
    before { publisher.books.first.book_inventories.create( :store_id => store.id, :copies_in_stock => 15, :copies_sold => 10) }
    before { publisher.books.second.book_inventories.create( :store_id => store.id, :copies_in_stock => 10, :copies_sold => 7) }
    before { publisher.books.third.book_inventories.create( :store_id => other_store.id, :copies_in_stock => 8, :copies_sold => 60) }
    before { other_publisher.books.first.book_inventories.create( :store_id => other_store.id, :copies_in_stock => 8, :copies_sold => 2) }
    before { get "/publishers/#{publisher.id}" }

    it "returns the publisher's stores" do
      expect(json).not_to be_empty
      expect(json["stores"].count).to eq(publisher.book_inventories.pluck(:store_id).uniq.count)
    end

    it 'returns the correct information' do
      expect(json["stores"].first["books_sold"]).to eq(publisher.book_inventories.where(store_id: other_store.id).sum(:copies_sold))
      expect(json["stores"].second["books_sold"]).to eq(publisher.book_inventories.where(store_id: store.id).sum(:copies_sold))
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

  end
end
