class CreateBookInventories < ActiveRecord::Migration[5.2]
  def change
    create_table :book_inventories do |t|
      t.references :book
      t.references :store
      t.integer :copies_in_stock
      t.integer :copies_sold 
      t.timestamps
    end
  end
end
