require 'json'
require_relative '../classes/musicalbum'
require_relative '../classes/genre'
require_relative 'validation'
require_relative '../serializers/serializearray'

class AlbumList
  include SerializationArray

  attr_accessor :list

  def initialize()
    @list = []
    @input = InputValidation.new
  end

  def album_attr
    title = @input.input_string('Title:')
    published_date = @input.input_date('Published date (yyyy-mm-dd):')
    [title, published_date]
  end

  def add_album
    title, published_date = album_attr
    album = MusicAlbum.new(title, published_date)

    # all of the label, genre, author = unknown
    puts 'Music Album created successfully'
    @list << album
    album
  end

  def show
    @list.each { |b| puts "#{b.type}: title: \"#{b.title}\", Genre: \"#{b.genre}\", Label: \"#{b.label}\"" }
  end

  # SERIALIZATION
  def take_array
    @list
  end

  def create_item
    MusicAlbum.new('', '')
  end

  def add_list(arr)
    @list = arr
  end
end