		require_relative 'basic'
		require 'csv'

		class Author 
			include Basic
			attr_accessor :name, :biography
			@author = Array.new

			def initialize(name, biography)
				@author = [name, biography]
			end
		end