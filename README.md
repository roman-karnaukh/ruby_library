# Library
* Book: title, author
* Order: book, reader, date
* Reader: name, email, city, street, house
* Author: name, biography
* Library: books, orders, readers, authors

# Write program that determines:
* Who often takes the book
* What is the most popular book
* How many people ordered one of the three most popular books
* Save all Library data to file(s)
* Get all Library data from file(s)

# Usage


  library_object = Library.new
  library_object.the_most_popular_book
  library_object.the_most_frequent_reader
  library_object.three_most_popular_books

###You can call also###

  library_object.books
  library_object.orders
  library_object.readers
  library_object.authors

  p "Test to save/delete Book"
  book_object=Book.new("Clera Pipa", "Raga Bomb")
  book_object.save
  book_object.delete

  p "Test to save/delete Author"
  author_object = Author.new("Boris Akunin", "May 20, 1956")
  author_object.save
  author_object.delete

  p "Test to save/delete Reader"
  reader_object = Reader.new("Boris","boris@gmail.com","Dnipro","Svetlaya",'123')
  reader_object.save
  reader_object.delete
