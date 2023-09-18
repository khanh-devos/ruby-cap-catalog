require_relative '../classes/game/game'
require_relative 'author_list'

class GameManager
  attr_reader :all_games

  def initialize
    @author_manager = AuthorManager.new
    @all_games = []
  end

  def list_all_games
    if @all_games.empty?
      puts "It seems we don't have any games."
    else
      puts 'Here is the Game List'
      @all_games.each do |game|
        puts "Multiplayer: #{game.multiplayer}, Published: #{game.published_date}, Last played: #{game.last_played_at}"
      end
    end
  end

  def list_all_authors
    author_manager.list_all_authors
  end

  def add_game(multiplayer, last_played_at, published_date, first_name, last_name)
    game = Game.new(multiplayer, last_played_at, published_date)
    author_manager.add_author(game, first_name, last_name)
    @all_games << game
  end

  private

  attr_reader :author_manager
end
