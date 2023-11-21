require_relative '../item'

class MusicAlbum < Item
  attr_reader :id, :on_spotify

  def initialize(publish_date, on_spotify)
    super(publish_date)
    @on_spotify = on_spotify
  end
end