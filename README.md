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
  library_object.add(book_object.get_v)<br>
  library_object.delete(book_object.get_v)<br>

  p "Test to save/delete Author"<br>
  author_object = Author.new("Boris Akunin", "May 20, 1956")<br>
  library_object.add(author_object.get_v)<br>
  p library_object.authors.include? author_object.get_v
  library_object.delete(author_object.get_v)<br>
  p library_object.authors.include? author_object.get_v

  p "Test to save/delete Reader"<br>
  reader_object = Reader.new("Boris","boris@gmail.com","Dnipro","Svetlaya",'123')<br>
  library_object.add(reader_object.get_v)<br>
  library_object.delete(reader_object.get_v)<br>

library_object.save_all

**