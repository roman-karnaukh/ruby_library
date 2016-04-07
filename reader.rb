		require_relative 'basic'
		require 'csv'

		class Reader
			include Basic
			attr_accessor :name, :email, :city, :street, :house
			@reader = Array.new

			def initialize(name, email, city, street, house)
				@reader = [name, email, city, street, house]
			end
		end