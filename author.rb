require_relative 'basic'
require 'csv'

class Author
  include Basic
  attr_accessor :name, :biography

  def initialize(name, biography)
    @name, @biography = name, biography
  end
end
