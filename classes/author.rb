require_relative 'item'
require 'date'

class Author
  attr_reader :items, :first_name, :last_name, :id

  def initialize(first_name, last_name)
    @id = Random.rand(1...1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_items(item)
    items << item
    item.author = self
  end
end
