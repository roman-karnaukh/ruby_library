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


  library_object = Library.new<br>
  library_object.the_most_popular_book<br>
  library_object.the_most_frequent_reader<br>
  library_object.three_most_popular_books<br>

  library_object.books<br>
  library_object.orders<br>
  library_object.readers<br>
  library_object.authors<br>

  p "Test to save/delete Book"<br>
  book_object=Book.new("Clera Pipa", "Raga Bomb")<br>
  book_object.save<br>
  book_object.delete<br>

  p "Test to save/delete Author"<br>
  author_object = Author.new("Boris Akunin", "May 20, 1956")<br>
  author_object.save<br>
  author_object.delete<br>

  p "Test to save/delete Reader"<br>
  reader_object = Reader.new("Boris","boris@gmail.com","Dnipro","Svetlaya",'123')<br>
  reader_object.save<br>
  reader_object.delete<br>
