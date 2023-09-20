require_relative 'validation'
require_relative '../classes/genre'
require_relative '../serializers/serializearray'

class GenreList
  include SerializationArray
  attr_accessor :list

  def initialize
    @list = [] # default
    @input = InputValidation.new
  end

  def show
    @list.each_with_index do |item, i|
      puts "#{i + 1} : \"#{item.name}\"  "
    end
  end

  def genre_attr
    @input.input_string('Add genre:')
  end

  def new_or_old_genre?(name)
    check_list = @list.map(&:name)

    return @list.find { |e| e.name == name.upcase } if check_list.include?(name.upcase)

    genre = Genre.new(name)
    # Add a new label to the @list
    @list << genre
    puts 'New genre added successfully'
    genre
  end

  def add_genre_for(new_item)
    name = genre_attr
    genre = new_or_old_genre?(name)

    new_item.add_label(genre)
  end

  def select_create_genre_for(new_item)
    show
    print('Select genre by index (0: create a new genre or enter to skip): ')
    input = gets.chomp.strip

    return if input.empty? # skipping

    index = input.to_i
    if index.zero?
      # Add new label for item
      add_genre_for(new_item)
    else
      # old label in the list
      genre = @list[index - 1]
      new_item.add_genre(genre)
    end

    puts 'Item added new genre successfully'
  end

  # SERIALIZATION
  def take_array
    @list
  end

  def create_item
    Genre.new('fake')
  end

  def add_list(arr)
    @list = arr
  end
end
