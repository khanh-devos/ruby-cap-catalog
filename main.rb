require 'json'
require_relative 'classes/author'
require_relative 'classes/book'
require_relative 'classes/game'
require_relative 'classes/genre'
require_relative 'classes/item'
require_relative 'classes/label'
require_relative 'classes/musicalbum'

require_relative 'solid/albumlist'
require_relative 'solid/authorlist'
require_relative 'solid/booklist'
require_relative 'solid/gamelist'
require_relative 'solid/genrelist'
require_relative 'solid/labellist'
require_relative 'solid/validation'

require_relative 'serializers/serializeitem'
require_relative 'serializers/serializearray'

def start
  puts 'Choose by index number'

  puts '1: show list of labels'
  puts '2: show list of books'

  puts '3: show list of authors'
  puts '4: show list of games'

  puts '5: show list of genres'
  puts '6: show list of music albums'

  puts '7: add a new book'
  puts '8: add a new game'
  puts '9: add a new music album'
  puts '10: quit'

  gets.chomp.to_i
end

def main # rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength
  booklist = BookList.new
  labellist = LabelList.new

  albumlist = AlbumList.new
  genrelist = GenreList.new

  gamelist = GameList.new
  authorlist = AuthorList.new

  booklist.read_data
  labellist.read_data
  albumlist.read_data
  genrelist.read_data
  gamelist.read_data
  authorlist.read_data

  100.times do # rubocop:disable Metrics/BlockLength
    opt = start

    case opt
    when 1
      labellist.show
    when 2
      booklist.show
    when 3
      authorlist.show
    when 4
      gamelist.show
    when 5
      genrelist.show
    when 6
      albumlist.show
    when 7
      new_book = booklist.add_book
      labellist.select_create_label_for(new_book)

    # genrelist.select_create_genre_for(new_book)
    # authorlist.select_create_author_for(new_book)
    when 8
      new_game = gamelist.add_game
      authorlist.select_create_author_for(new_game)
    when 9
      new_album = albumlist.add_album
      genrelist.select_create_genre_for(new_album)
    else
      booklist.write_data
      labellist.write_data

      albumlist.write_data
      genrelist.write_data

      gamelist.write_data
      authorlist.write_data

      puts 'Thank you for using'
      break
    end
  end
end

main
