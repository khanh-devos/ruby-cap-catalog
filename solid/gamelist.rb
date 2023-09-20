require 'json'
require_relative '../classes/game'
require_relative '../classes/author'
require_relative '../serializers/serializearray'
require_relative 'validation'

class GameList
  include SerializationArray
  attr_accessor :list

  def initialize
    @list = []
    @input = InputValidation.new
  end

  def game_attr
    item_type = 'GAME'
    title = @input.input_string('Game Title:')
    published_date = @input.input_date('Published date (yyyy-mm-dd):')
    multiplayer = @input.input_yes_no('Is it multiplayer? (y/n):')
    last_played_at = @input.input_date('Last played date (yyyy-mm-dd):')

    [item_type, title, published_date, multiplayer, last_played_at]
  end

  def add_game
    _, title, published_date, multiplayer, last_played_at = game_attr
    game = Game.new(title, published_date, multiplayer, last_played_at)

    puts 'Game created successfully'
    @list << game
    game
  end

  def show
    @list.each do |game|
      puts "GAME: Title: #{game.title}, Type: #{game.type}, Published Date: #{game.published_date},
      Multiplayer: #{game.multiplayer}, Last Played At: #{game.last_played_at}, Author: #{game.author},
      Label: #{game.label}"
    end
  end

  # SERIALIZATION
  def take_array
    @list
  end

  def create_item
    Game.new('', '', false, nil)
  end

  def add_list(arr)
    @list = arr
  end
end
