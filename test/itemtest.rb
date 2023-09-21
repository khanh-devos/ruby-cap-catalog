require 'rspec'
require_relative '../classes/item'

RSpec.describe Item do
  context 'test class Item: ' do
    before :each do
      @item = Item.new('check', '2010-01-10')
    end

    it 'check all attrs' do
      expect(@item.type).to eql('check')
      expect(@item.published_date).to eql('2010-01-10')
      expect(@item.archived).to eql(false)

      expect(@item.genre).to eql(nil)
      expect(@item.label).to eql(nil)
      expect(@item.author).to eql(nil)

      @item.move_to_archive
      expect(@item.archived).to eql(true)
    end

    it 'check method add_label' do
      @item.add_label MockLabel.new 'mocklabel'
      expect(@item.label).to eql('MOCKLABEL')
    end

    it 'check method add_genre' do
      @item.add_genre MockGenre.new 'mockgenre'
      expect(@item.genre).to eql('MOCKGENRE')
    end

    it 'check method add_author' do
      @item.add_author MockAuthor.new('first_name', 'last_name')
      expect(@item.author).to eql('first_name last_name')
    end
  end
end

class MockLabel
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
    item.label = @title
  end
end

class MockGenre
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

class MockAuthor
  attr_reader :id, :first_name, :last_name
  attr_accessor :items

  def initialize(first_name, last_name)
    @id = rand(0..100)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    return if items.include?(item.id)

    items << item.id
    item.author = "#{@first_name} #{@last_name}"
  end
end
