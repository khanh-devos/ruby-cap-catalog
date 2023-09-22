require_relative 'item'

class MusicAlbum < Item
  attr_accessor :cover_state, :publisher, :title, :on_spotify

  def initialize(title, published_date, on_spotify: true)
    super('ALBUM', published_date)
    @title = title
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
