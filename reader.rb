require_relative 'basic'
require 'csv'

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