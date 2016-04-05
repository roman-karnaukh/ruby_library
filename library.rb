require_relative 'basic'
require_relative 'author'
require_relative 'reader'
require_relative 'order'
require_relative 'book'
require 'csv'

class Library < Basic
	attr_reader :books, :orders, :readers, :authors
	
	def i_want_to_open(file_name)
		puts file_name[/[a-z]+/].capitalize
		CSV.read(file_name, headers:true).each do |row|
			p row
		end
	end

	def library_open

		i_want_to_open('books.csv')
		i_want_to_open('orders.csv')
		i_want_to_open('authors.csv')
		i_want_to_open('readers.csv')
		
	end

	def put_readers_of_the_book_by_it_index(index)
		@readers = []
		puts "Readers who order the book: #{@boooks_array_without_raiting[index]}"
			CSV.foreach('orders.csv', headers:true) do |row|
				next if readers.include? row['Reader']
				@readers << row['Reader'] if row['Book'] == @boooks_array_without_raiting[index]
			end
		puts @readers
	end

	def reader_read_book(reader_name, book_title)
		#@date = Time.new
		@record = [reader_name,book_title]
		@books_read = CSV.read('books.csv', headers:true)
		@readers_read = CSV.read('readers.csv', headers:true)

		if @books_read.to_s.include? book_title 
			if @readers_read.to_s.include? reader_name
				CSV.open('library_register.csv', 'a+') do |file|
					file << @record
				end
				puts "Record #{@record} saved"
			else
				return p "Error - there is no reader name you entered"
			end
		else
			p "Error - there is no book you selected"
		end
	end

	def the_most_popular(object)
		@library_register = CSV.read('library_register.csv', headers:true)
		books_string = @library_register.to_s
		words = books_string.split(/[\n,'\n]/)
		#p words
		frequencies = Hash.new(0)
		words.each { |word| frequencies[word] += 1 }
		frequencies = frequencies.sort_by {|a, b| b }
		frequencies.reverse!
		case object
			when 'book'
			@popular_book = frequencies.select { |word, frequency|  read('books.csv').to_s.include? word }
			@popular_book = @popular_book.first
			puts "The most popular #{object} is #{@popular_book[0]}, it`s readed #{@popular_book[1]} times"

			when 'reader'
			@reader_often_takes_the_book = frequencies.select { |word, frequency|  read('readers.csv').to_s.include? word }
			@reader_often_takes_the_book = @reader_often_takes_the_book.first
			puts "The most popular #{object} is #{@reader_often_takes_the_book[0]}, had readed #{@reader_often_takes_the_book[1]} books"
			
			when 'three_most_popular_books'
			@three_popular_books = frequencies.select { |word, frequency|  read('books.csv').to_s.include? word }
			@three_popular_books = @three_popular_books[0..2]
			puts "#{object.capitalize.gsub!(/[\_]/, " ")} are:"#{@three_popular_books}

			@boooks_array_without_raiting = []
			@three_popular_books.each {|book, raiting| @boooks_array_without_raiting.push book}

			@boooks_array_without_raiting.each {|book| puts book}

			put_readers_of_the_book_by_it_index(0)
			put_readers_of_the_book_by_it_index(1)
			put_readers_of_the_book_by_it_index(2)

		else
			puts "Please, clarify your request, I can`t find #{object}!"
		end
	end
end


library_class = Library.new
library_class.library_open

#library_class.reader_read_book("Roman","Chemp")
library_class.reader_read_book("Romano","Chemp")
library_class.reader_read_book("Roman","The Death of Achilles")


library_class.the_most_popular('book')
library_class.the_most_popular('reader')
library_class.the_most_popular('three_most_popular_books')

=begin
p "Test to save/delete Book"
book_class=Book.new("Clera Pipa", "Raga Bomb")
book_class.save
book_class.delete

p "Test to save/delete Author"
author_class = Author.new("Boris Akunin", "May 20, 1956")
author_class.save
author_class.delete

p "Test to save/delete Reader"
reader_class = Reader.new("Boris","boris@gmail.com","Dnipro","Svetlaya",'123')
reader_class.save
reader_class.delete
=end