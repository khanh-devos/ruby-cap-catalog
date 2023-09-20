require_relative 'item'

class MusicAlbum < Item
  attr_accessor :cover_state, :publisher, :title

  def initialize(title, artist, release_date, on_spotify)
    @title = title
    @artist = artist
    @release_date = release_date
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super.can_be_archived? || (@cover_state == 'bad')
  end
end
