Book Keeper is a light-weight, Rails API application designed to manage
book inventories.

Publishers have_many books, and are able to stock these books in stores
for sale. Book Keeper generates a book_inventory model that represents a
publisher's stock of a certain book at a given store. Each book_inventory
tracks the number of books in stock, as well as how many have been sold.

Currently, Book Keeper employs two methods to track book inventory. A GET
request for a given publisher will return a list of shops selling one or
more books belonging to that publisher, as well as a list of the publisher's
books in stock at that store. The list is ordered by book sales, with the highest
seller appearing first.

Book Keeper can also update sales records, by sending a PUT request to a store
and updating a given book_inventory for that store. The request supplies the
number of books sold, updating both the books sold and books remaining attributes.
