		require_relative 'basic'
		require 'csv'

		class Book
			include Basic
			attr_accessor :title, :author, :book
			@book = Array.new

			def initialize(title, author)
				@book = [title, author]
			end
		end