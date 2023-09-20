require 'securerandom'
require_relative '../serializers/serializeitem'

class Item
  include SerializationItem
  attr_reader :id, :type, :archived
  attr_accessor :genre, :author, :label, :published_date

  def initialize(type, published_date, genre = nil, author = nil, label = nil)
    @id = rand 0..100
    @type = type

    @published_date = published_date
    @archived = false

    unless genre.nil?
      @genre = genre.name
      genre.items << @id
    end

    unless author.nil?
      @author = "#{author.first_name} #{author.last_name}"
      author.items << @id
    end

    return if label.nil?

    @label = label.title
    label.items << @id
  end

  private

  def can_be_archived?
    today = Time.now
    year = today.year
    month = today.month
    day = today.day
    point_of_10_years_algo = Time.new(year - 10, month, day)

    arr = @published_date.split('-', 3)
    pdate = Time.new(arr[0], arr[1], arr[2])

    # older than 10 years => true 
    (pdate < point_of_10_years_algo)
  end

  public

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_label(label)
    label.add_item(self)
  end


  def add_genre(genre)
    genre.add_item(self)

  def add_author(author)
    @author = author
  end
end
