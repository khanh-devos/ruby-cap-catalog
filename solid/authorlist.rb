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

  def add_author
    first_name, last_name = author_attr
    author = Author.new(first_name, last_name)

    puts 'Author created successfully'
    @list << author
    author
  end

  def show
    @list.each do |author|
      puts "AUTHOR: First Name: #{author.first_name},
      Last Name: #{author.last_name}, Books/Games: #{author.items.length}"
    end
  end

  def select_create_author_for(_item_list)
    author = select_author
    return author if author

    author = add_author if @input.input_yes_no('Do you want to create a new author? (y/n):')

    author || Author.new('', '')
  end

  private

  def select_author
    puts 'Select by index (0: create a new or enter to skip)'
    @list.each_with_index { |author, index| puts "#{index + 1}: #{author.first_name} #{author.last_name}" }
    input = gets.chomp.strip.to_i
    return @list[input - 1] if input.between?(1, @list.length)

    nil
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
