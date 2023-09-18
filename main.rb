require_relative 'solid/game_manager'
require_relative 'data/save_data'
require_relative 'data/fetch_data'

class Main
  ACTIONS = {
    1 => { method: :list_books },
    2 => { method: :list_music_albums },
    3 => { method: :list_games },
    4 => { method: :list_genres },
    5 => { method: :list_labels },
    6 => { method: :list_authors },
    7 => { method: :add_book },
    8 => { method: :add_music_album },
    9 => { method: :add_game },
    0 => { method: :exit_app }
  }.freeze

  def initialize
    @game_manager = GameManager.new
    @save_data = SaveData.new
    @fetch_data = FetchData.new
  end

  def run
    @fetch_data.fetch_all(@game_manager)
    selected_option = nil
    loop do
      display_options(selected_option)
      number = gets.chomp.to_i
      selected_option = number
      if number.zero?
        @save_data.save_all(@game_manager)
        exit_app
        break
      end
      action = ACTIONS[number]
      if action
        send(action[:method])
      else
        puts 'Enter a valid number'
      end
    end
  rescue StandardError => e
    puts "An error occurred: #{e.message}"
  end

  def display_options(selected_option)
    options = [
      '1️   List all books',
      '2️   List all music albums',
      '3️   List of games ',
      '4️   List all genres',
      '5️   List all labels',
      '6️   List all authors ',
      '7️   Add a book',
      '8️   Add a music album',
      '9️   Add a game',
      '0️   Exit'
    ]

    options.each_with_index do |option, index|
      if (index + 1) == selected_option
        puts "=> #{option}"
      else
        puts option
      end
    end
    print 'Choose option: '
  end

  def list_games
    @game_manager.list_all_games
  end

  def list_authors
    @game_manager.list_all_authors
  end

  def add_game
    puts 'Great Choice, is the game Multiplayer? [yes/no]'
    input = gets.chomp.downcase
    multiplayer = input == 'yes'
    print 'When was it published? Enter a Date [yy-mm-dd]: '
    publish_date = gets.chomp
    print 'When was it last played? Enter a Date [yy-mm-dd]: '
    last_played_at = gets.chomp
    puts 'Finally, what author should it have?'
    print 'First name: '
    first_name = gets.chomp
    print 'Last name: '
    last_name = gets.chomp
    @game_manager.add_game(multiplayer, last_played_at, publish_date, first_name, last_name)
    puts ' 🎉 Game created successfully!'
  end

  def exit_app
    @save_data.save_all(@game_manager)
    puts '🎉 Thank you for exploring our library'
  end
end

def display_header
  puts 'Welcome to My-Catalog'
end

display_header
main = Main.new
main.run
