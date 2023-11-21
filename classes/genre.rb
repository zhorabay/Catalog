class Genre
  attr_accessor :name
  attr_reader :id, :items

  def initialize(name)
    @id = Random.rand(1...1000)
    @name = name
    @items = []
  en

  def add_item(item)
    @items << item
    item.genre = self
  end
end