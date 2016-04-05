require_relative 'basic'
require 'csv'

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