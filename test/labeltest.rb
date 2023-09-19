require 'rspec'
require_relative '../classes/label'


RSpec.describe Label do
  context 'test class Label: ' do
    before :each do
      @title = 'label1'
      @color = 'white'
      @label = Label.new(@title, @color)
    end

    it 'test all attrs' do
      expect(@label.title).to eql(@title.upcase)
      expect(@label.color).to eql(@color)
      expect(@label.items.length).to eql(0)
    end

    it 'test method add_item when add same item and different item' do
      mock_item1 = MockItem.new
      @label.add_item mock_item1
      @label.add_item mock_item1
      expect(@label.items.length).to eql(1)
      
      mock_item2 = MockItem.new
      @label.add_item mock_item2
      expect(@label.items.length).to eql(2)
    end

  end
end

class MockItem
  attr_accessor :label, :id
  def initialize
    @id = rand 0..100
    @label = nil
  end
end