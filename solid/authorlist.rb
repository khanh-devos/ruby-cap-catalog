require_relative 'validation'
require_relative '../classes/author'
require_relative '../serializers/serializearray'

class AuthorList
  include SerializationArray
  attr_accessor :list

  def initialize
    @list = []
    @input = InputValidation.new
  end

  def author_attr
    first_name = @input.input_string('First Name:')
    last_name = @input.input_string('Last Name:')
    [first_name, last_name]
  end

  def select_create_author_for(new_item)
    show_with_index
    print('Select author by index (0: create a new author or enter to skip): ')
    input = gets.chomp.strip

    return if input.empty?

    index = input.to_i
    if index.zero?
      first_name, last_name = author_attr
      author = Author.new(first_name, last_name)
      @list << author
      new_item.add_author(author)
    elsif index.between?(1, @list.length)
      author = @list[index - 1]
      new_item.add_author(author)
      puts "Selected existing author (#{index}): #{author.first_name} #{author.last_name}"
    else
      puts 'Invalid index. Author not added.'
    end

    puts 'Item author added successfully'
  end

  private

  def show_with_index
    @list.each_with_index do |author, index|
      puts "AUTHOR: #{index + 1} - First Name: #{author.first_name}, " \
           "Last Name: #{author.last_name}, Books/Games: #{author.items.length}"
    end
  end

  def show
    @list.each do |author|
      puts "AUTHOR: First Name: #{author.first_name},
      Last Name: #{author.last_name}, Books/Games: #{author.items.length}"
    end
  end

  # SERIALIZATION
  def take_array
    @list
  end

  def create_item
    Author.new('', '')
  end

  def add_list(arr)
    @list = arr
  end
end
