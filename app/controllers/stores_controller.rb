class StoresController < ApplicationController

  def update
    @store = Store.find(params[:id])
    inventory = @store.book_inventories.find_by_book_id(params[:book_id])
    inventory.copies_in_stock -= params[:copies_sold].to_f
    inventory.copies_sold += params[:copies_sold].to_f
    inventory.save!
  end

end
