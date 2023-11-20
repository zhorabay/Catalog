require 'date'

class Item
  attr_accessor :id, :publish_date
  attr_reader :archived, :author, :label

  def iniitialize(publish_date, archived: false, id: Random.rand(1...1000))
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  def genre=(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def can_be_archived()
    difference = Time.now.year - @publish_date.year.move_to_i
    difference >= 10
  end
end