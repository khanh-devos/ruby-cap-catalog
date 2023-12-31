class Label
  include SerializationItem
  attr_reader :id, :title
  attr_accessor :color, :items

  def initialize(title, color = 'white')
    @id = rand 0..100
    @color = color
    @title = title.upcase
    @items = []
  end

  def add_item(item)
    return if @items.include?(item.id)

    @items << item.id
  end
end
