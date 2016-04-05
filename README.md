# ruby_library

Library
Book: title, author
Order: book, reader, date 
Reader: name, email, city, street, house
Author: name, biography
Library: books, orders, readers, authors

Methods for:

Who often takes the book           Library :: the_most_popular('reader')
What is the most popular book      Library :: the_most_popular('book')
How many people ordered one of the 
three most popular books           Library :: the_most_popular('three_most_popular_books')
Save all Library data to file(s)   All classes have their own 'save' and 'delete' methods with needed parameters extends of Basic class
Get all Library data from file(s)  Library :: library_open  - for all, or Library :: i_want_to_open(file) 
                                   where 'file' is the name of file with information you want to see 
