require_relative '../item'
require 'date'

class Game < Item
  attr_reader :author, :last_played_at, :multiplayer

  def initialize(multiplayer, last_played_at, published_date)
    super(published_date)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def can_be_archived?
    parent = super
    last_played_at_year = @last_played_at.year
    current_year = Time.now.year
    parent && current_year - last_played_at_year > 2
  end
end
