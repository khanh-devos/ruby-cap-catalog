require 'json'
require_relative '../classes/book'
require_relative '../classes/label'
require_relative './validation'
require_relative '../serializers/serializearray'


class BookList
  include SerializationArray

  attr_accessor :list

  def initialize()
    @list = []
    @input = InputValidation.new
  end

  def book_attr
    title = @input.input_string('Title:')
    published_date = @input.input_date('Published date (yyyy-mm-dd):')
    [title, published_date]
  end

  def add_book
    title, published_date = book_attr
    book = Book.new(title, published_date)
    
    # all of the label, genre, author = unknown
    puts 'Book created successfully'
    @list << book
    book
  end

  def show
    @list.each { |b| puts "BOOK: title: \"#{b.title}\"; Author: \"#{b.author}\"" }
  end


  # SERIALIZATION
  def take_array
    @list
  end

  def create_item
    Book.new('', '')
  end

  def add_list(arr)
    @list = arr
  end
end
