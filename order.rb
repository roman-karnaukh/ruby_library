		require_relative 'basic'
		require 'csv'

		class Order
			include Basic
			attr_accessor :book, :reader, :date
			@order = Array.new

			def initialize(book, reader, date)
				@order = [book, reader, date]
			end
		end