require 'csv'
require 'date'

class Basic
	def read(file)
		CSV.read(file, headers:true)
	end

	def save(file, variable)
		@readed = read(file)
		if @readed.to_a.include? variable
			puts "#{self.class.name} you try to add already exists"
		else
			CSV.open(file, 'a+') do |file|
				file << variable
			end
			puts "Entered #{self.class.name.downcase}: #{variable} saved"
		end
	end

	def delete(file, variable)
		@variable_to_delete = variable
		@readed_file = read(file)

		if @readed_file.to_a.include? @variable_to_delete
			#index = @readed_file.to_a.index{|e,v| [e,v] == @variable_to_delete}
			#@readed_file.delete(index)

			CSV.open(file, 'w') do |csv|
			    @readed_file.to_a.each do |a|
			    	next if a == @variable_to_delete
			        csv << a
			    end
			end

			puts "#{self.class.name} #{@variable_to_delete} deleted"
		else
			puts "There is no #{self.class.name.downcase}: #{@variable_to_delete} you want to delete"
		end
	end

end

class Book < Basic
	attr_accessor :title, :author
	@books = Array.new

	def initialize(title, author)
		@title = title
		@author = author
		@books = [@title, @author]
	end


	def save(file = 'books.csv', variable = @books)
		super
	end

	def delete(file = 'books.csv', variable = @books)
		super
	end
	
end


class Order
	attr_accessor :book, :reader, :date
	def initialize(book, reader, date)
		@book = book
		@reader = reader
		@date = date
		@order = [@book, @reader, @date]
	end

	def save(file = 'orders.csv', variable = @order)
		super
	end

	def delete(file = 'orders.csv', variable = @order)
		super
	end
end

class Reader < Basic
	attr_accessor :name, :email, :city, :street, :house
	def initialize(name, email, city, street, house)
		@name = name
		@email = email
		@city = city
		@street = street
		@house = house
		@reader = [@name, @email, @city, @street, @house]
	end

	def save(file = 'readers.csv', variable = @reader)
		super
	end

	def delete(file = 'readers.csv', variable = @reader)
		super
	end
end


class Author < Basic
	attr_accessor :name, :biography

	def initialize(name, biography)
		@name = name
		@biography = biography
		@author = [@name, @biography]
	end

	def save(file = 'authors.csv', variable = @author)
		super
	end

	def delete(file = 'authors.csv', variable = @author)
		super
	end

end

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
		words = books_string.split(/[\s,']/)
		#p words
		frequencies = Hash.new(0)
		words.each { |word| frequencies[word] += 1 }
		frequencies = frequencies.sort_by {|a, b| b }
		frequencies.reverse!
		case object
			when 'book'
			@popular_book = frequencies.select { |word, frequency|  read('books.csv').to_s.include? word }
			@popular_book = @popular_book.first
			p "The most popular #{object} is #{@popular_book[0]}, it`s readed #{@popular_book[1]} times"

			when 'reader'
			@reader_often_takes_the_book = frequencies.select { |word, frequency|  read('readers.csv').to_s.include? word }
			@reader_often_takes_the_book = @reader_often_takes_the_book.first
			p "The most popular #{object} is #{@reader_often_takes_the_book[0]}, had readed #{@reader_often_takes_the_book[1]} books"
		else
			puts "Please, clarify your request, I can`t find #{object}!"
		end
	end
end


library_class = Library.new
library_class.library_open

library_class.books

library_class.reader_read_book("Roman","Chemp")
library_class.reader_read_book("Romano","Chemp")
library_class.reader_read_book("Roman","Chemps")


library_class.the_most_popular('book')
library_class.the_most_popular('reader')
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