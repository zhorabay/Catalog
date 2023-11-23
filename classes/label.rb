class Label
  attr_reader :id, :title, :color, :items

  def initialize(title, color)
    @id = Random.rand(1...1000)
    @title = title
    @color = color
    @items = []
  end

  def add_items(item)
    @items << item
    item.label = self
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end
end
