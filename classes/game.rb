require_relative 'item'
require 'date'

class Game < Item
  attr_reader :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def aligable
    (Date.today.year - @last_played_at.year) > 2
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  private

  def can_be_archived?
    super && aligable
  end
end
