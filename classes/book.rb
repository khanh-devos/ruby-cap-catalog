require_relative './item'

class Book < Item
    attr_accessor :cover_state, :publisher, :title

    def initialize(title, published_date, cover_state = 'good', publisher = nil)
        super('BOOK', published_date)

        @title = title
        @cover_state = cover_state
        @publisher = publisher if !publisher.nil?
    end

    private
    
    def can_be_archived?
        super.can_be_archived? || (@cover_state == 'bad')
    end

end