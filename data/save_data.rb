require 'json'

class SaveData
  def save_all(game_manager)
    save_games(game_manager)
    # Please Add save_books and save_music_albums here
  end

  def save_games(game_manager)
    file_path = 'data/JSON/games.json'

    begin
      games = game_manager.all_games
      data = games.map do |game|
        {
          multiplayer: game.multiplayer,
          last_played_at: game.last_played_at,
          published_date: game.published_date,
          first_name: game.author.first_name,
          last_name: game.author.last_name
        }
      end

      File.open(file_path, 'w') do |file|
        file.puts(JSON.pretty_generate(data))
      end
    rescue StandardError => e
      puts "An error occurred while saving data: #{e.message}"
    end
  end

  # Please Add save_books and save_music_albums here
end
