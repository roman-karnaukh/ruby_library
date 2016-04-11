		require_relative 'basic'
		require_relative 'author'
		require_relative 'reader'
		require_relative 'order'
		require_relative 'book'
		require 'csv'

		class Library
			include Basic
			attr_reader :books, :orders, :readers, :authors
			
			def library_open
				@books = []
				@orders = []
				@readers = []
				@authors = []
				load_to_array(@books, "books.csv")
				load_to_array(@authors, "authors.csv")
				load_to_array(@readers, "readers.csv")
				load_to_array(@orders, "orders.csv")
			end

			def reader_read_book(reader_name, book_title)
				if @books.to_s.include? book_title
					if @readers.to_s.include? reader_name
						CSV.open('./data/library_register.csv', 'a+') {|file| file << [reader_name,book_title]}
						puts "Record #{[reader_name,book_title]} saved"
					else
						p "Error - there is no reader name you entered"
					end
				else
					p "Error - there is no book you selected"
				end
			end

			def the_most_popular_book
				@popular_book = load_with_raiting.select { |title, frequency|  @books.to_s.include? title }
				puts "The most popular book is #{@popular_book.first[0]}, it`s readed #{@popular_book.first[1]} times"
			end

			def the_most_frequent_reader
				@frequent_reader = load_with_raiting.select { |name, frequency|  @readers.to_s.include? name }
				puts "The most frequent reader is #{@frequent_reader.first[0]}, had readed #{@frequent_reader.first[1]} books"
			end

			def three_most_popular_books
				@three_most_popular_books = load_with_raiting.select { |title, frequency|  @books.to_s.include? title }
				@books_raiting = []
				@three_most_popular_books.take(3).each {|book, raiting| @books_raiting.push book}
				put_readers_by_book_index(rand(0..2))
			end

			private
			def load_with_raiting
				words = read('library_register.csv').to_s.split(/[\n,'\n]/)
				frequencies = Hash.new(0)
				words.each { |word| frequencies[word] += 1 }
				frequencies = frequencies.sort_by {|name, raiting| raiting }
				frequencies.reverse!
			end

			def put_readers_by_book_index(index)
				puts "Readers who order one of the tree most readed books: #{@books_raiting[index]}"
				@most_popular_book_readers = []
				@orders.each {|title, reader, date| @most_popular_book_readers.push reader if title == @books_raiting[index] }
				@most_popular_book_readers.uniq.each {|name| p name}
			end
		end
   
=begin
		library_object = Library.new
		library_object.library_open

		#library_object.reader_read_book("Roman","Chemp")
		library_object.reader_read_book("Romano","Chemp")
		library_object.reader_read_book("Roman","The Death of Achilles")


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

=end