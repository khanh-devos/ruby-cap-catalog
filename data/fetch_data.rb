require 'json'

class FetchData
  def fetch_all(game_manager)
    fetch_games(game_manager)
  end

  def fetch_games(game_manager)
    File.write('data/JSON/games.json', JSON.pretty_generate([])) unless File.exist?('data/JSON/games.json')

    file = File.read('data/JSON/games.json')
    data = JSON.parse(file, symbolize_names: true)
    data.each do |game_data|
      multiplayer = game_data[:multiplayer]
      last_played_at = game_data[:last_played_at]
      published_date = game_data[:published_date]
      first_name = game_data[:first_name]
      last_name = game_data[:last_name]
      game_manager.add_game(multiplayer, last_played_at, published_date, first_name, last_name)
    end
  end
end
