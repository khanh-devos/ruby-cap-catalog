require 'rspec'
require_relative '../classes/book'

RSpec.describe Book do
  context 'test class Book: ' do
    before :each do
      @title = 'book1'
      @date = '2020-1-1'
      @book = Book.new(@title, @date)
    end
   
    it 'test all attrs' do
      expect(@book.type).to eql('BOOK')
      expect(@book.title).to eql(@title)
      expect(@book.published_date).to eql(@date)
      expect(@book.label).to eql(nil)
    end

  end
end


class MockLabel
  attr_reader :label
  def initialize(label = 'mocklabel')
    @label = label
  end

  def add_item(item)
    item.label = @label
  end
end