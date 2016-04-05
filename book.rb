require_relative 'basic'
require 'csv'

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