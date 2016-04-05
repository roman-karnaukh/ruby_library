require_relative 'basic'
require 'csv'

class Order < Basic
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