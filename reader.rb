require_relative 'basic'
require 'csv'

class Reader
  include Basic
  attr_accessor :name, :email, :city, :street, :house

  def initialize(name, email, city, street, house)
    @name, @email, @city, @street, @house = name, email, city, street, house
  end
end
