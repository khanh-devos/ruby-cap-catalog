require 'rspec'
require_relative '../classes/item'

RSpec.describe Item do
  context 'test class Item: ' do
    before :each do
      @item = Item.new('check', 'today')
    end

    it 'check all attrs' do
      expect(@item.type).to eql('check')
      expect(@item.published_date).to eql('today')
      expect(@item.archived).to eql(false)

      expect(@item.genre).to eql(nil)
      expect(@item.label).to eql(nil)
      expect(@item.author).to eql(nil)
    end

    it 'check method add_label' do
      @item.add_label MockLabel.new
      expect(@item.label).to eql('mocklabel')
    end
  end
end

class MockLabel
  attr_reader :title

  def initialize
    @title = 'mocklabel'
  end

  def add_item(item)
    item.label = @title
  end
end
