require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publish_date, publisher, cover_state)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
