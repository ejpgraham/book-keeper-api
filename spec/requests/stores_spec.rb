require 'rails_helper'

RSpec.describe 'Stores API', type: :request do
  let(:store) { create(:store) }
  let(:publisher) { create(:publisher) }
  let(:book) { create(:book) }
  let(:book_sale_params) { {id: store.id, book_id: book.id, copies_sold: 5} }

  describe 'Marks books for a store sold' do
    before {book.publisher = publisher}
    before { book.book_inventories.create( :store_id => store.id, :copies_in_stock => 5, :copies_sold => 0) }
    before { put "/stores/#{store.id}", params: book_sale_params }
    context 'when the book exists at the store' do
      it "updates the store's inventory" do
        expect(store.book_inventories.first.copies_in_stock).to eq(0)
        expect(store.book_inventories.first.copies_sold).to eq(5)
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

end
