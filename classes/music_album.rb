require_relative 'item'
require 'date'

class MusicAlbum < Item
  attr_reader :id, :on_spotify

  def initialize(publish_date, on_spotify)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  private

  def can_be_archived?
    super == true && @on_spotify == true
  end
end
