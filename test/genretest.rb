require 'rspec'
require_relative '../classes/genre'

RSpec.describe Genre do
  context 'test class Genre: ' do
    before :each do
      @name = 'genre1'
      @genre = Genre.new(@name)
    end

    it 'test all attrs' do
      expect(@genre.name).to eql(@name.upcase)
      expect(@genre.items.length).to eql(0)
    end

    it 'test method add_item when add same item and different item' do
      mock_item1 = MockItem.new
      @genre.add_item mock_item1
      @genre.add_item mock_item1
      expect(@genre.items.length).to eql(1)

      mock_item2 = MockItem.new
      @genre.add_item mock_item2
      expect(@genre.items.length).to eql(2)
    end
  end
end

class MockItem
  attr_accessor :genre, :id

  def initialize
    @id = rand 0..100
    @genre = nil
  end
end
