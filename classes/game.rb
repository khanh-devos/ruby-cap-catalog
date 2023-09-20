require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(item_type, published_date, multiplayer, last_played_at = nil)
    super(item_type, published_date)

    @multiplayer = multiplayer
    @last_played_at = last_played_at unless last_played_at.nil?
  end

  private

  def can_be_archived?
    unless last_played_at.nil?
      age_in_seconds = Time.now - last_played_at

      return age_in_seconds > (2 * 365 * 24 * 60 * 60)
    end

    false
  end
end
