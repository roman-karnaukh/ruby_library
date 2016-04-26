require_relative 'basic'
require 'csv'

class Book
  include Basic
  attr_accessor :title, :author, :book

  def initialize(title, author)
    @title, @author = title, author
  end
end
