require_relative 'item'

class Genre
  attr_accessor :name
  attr_reader :id, :items

  def initialize(name)
    @id = Random.rand(1...1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end
end
