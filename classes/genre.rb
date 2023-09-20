class Genre
  include SerializationItem
  attr_reader :id
  attr_accessor :name, :items

  def initialize(name)
    @id = rand 0..100
    @name = name.upcase
    @items = []
  end

  def add_item(item)
    return if @items.include?(item.id)

    @items << item.id
    item.genre = @name
  end
end
