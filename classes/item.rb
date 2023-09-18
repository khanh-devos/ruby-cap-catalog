require 'securerandom'


class Item
  attr_reader :published_date, :id, :author
  attr_accessor :archived

  def initialize(published_date)
    @id = SecureRandom.hex
    @published_date = published_date
    @archived = false
    @author = nil
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

    (pdate < point_of_10_years_algo)
  end

  public

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def author=(author)
    @author = author
    author.items.push(self)
  end
end
