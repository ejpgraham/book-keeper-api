class PublishersController < ApplicationController

  def show
    @publisher = Publisher.find(params[:id])
    stores = @publisher.book_inventories.map(&:store).uniq
    response = stores.map {|store|
      {
      id: store.id,
      name: store.name,
      books_sold: @publisher.book_inventories.where(store_id: store.id).sum(:copies_sold),
      books_in_stock: @publisher.book_inventories.where("copies_in_stock > ?", 0).map {|inventory|
          {
            id: inventory.book.id,
            title: inventory.book.title,
            copies_in_stock: inventory.copies_in_stock
          }
        }
      }
    }
    render json: {stores: response.sort_by{|store| store["books_sold"]}.reverse}
  end


end
