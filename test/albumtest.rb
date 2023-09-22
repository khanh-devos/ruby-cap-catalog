require 'rspec'
require_relative '../classes/musicalbum'

RSpec.describe MusicAlbum do
  context 'test class MusicAlbum: ' do
    before :each do
      @title = 'album1'
      @date = '2020-1-1'
      @album = MusicAlbum.new(@title, @date)
    end

    it 'test all attrs' do
      expect(@album.type).to eql('ALBUM')
      expect(@album.title).to eql(@title)
      expect(@album.published_date).to eql(@date)
      expect(@album.genre).to eql(nil)
    end
  end
end

class MockGenre
  attr_reader :genre

  def initialize(genre = 'mockgenre')
    @genre = genre
  end

  def add_item(item)
    item.genre = @genre
  end
end
