require_relative 'basic'
require_relative 'author'
require_relative 'reader'
require_relative 'order'
require_relative 'book'
require 'csv'

class Library
	include Basic
	attr_reader :books, :orders, :readers, :authors

	VARIABLES = %w[books authors readers orders]

	def initialize
	  @books = []
    @orders = []
    @readers = []
    @authors = []
    load(VARIABLES)
  end

	def the_most_popular_book
	  @popular_book = rating_of("books").take(1)
    puts "The most popular book is #{@popular_book[0][0]}, it`s readed #{@popular_book[0][1]} times"
	end

	def the_most_frequent_reader
	  @frequent_reader = rating_of("readers").take(1)
	  puts "The most frequent reader is #{@frequent_reader[0][0]}, had readed #{@frequent_reader[0][1]} books"
	end

	def three_most_popular_books
	  @books_raiting = []
	  @three_most_popular_books = rating_of("books").take(3).each {|book, raiting| @books_raiting.push book}
    put_readers_by_book_index(rand(0..2))
	end

	def save
		save_all(VARIABLES)
	end

	private
	def rating_of(name)
		name == "books"? @row_index = 0 : @row_index = 1
    @raiting_arr = @orders.group_by{|row| row[@row_index]}.map {|name, value| [name, value.size]}
	  @raiting_arr.sort_by{|name, count| count}.reverse
	end

	def put_readers_by_book_index(index)
	  puts "Readers who order one of the tree most popular books: #{@books_raiting[index]}"
	  @most_popular_book_readers = []
	  @orders.each {|title, reader, date| @most_popular_book_readers.push reader if title == @books_raiting[index] }
	  @most_popular_book_readers.uniq.each {|name| p name}
	end
end


		library_object = Library.new

		library_object.the_most_popular_book
		library_object.the_most_frequent_reader
		library_object.three_most_popular_books




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


