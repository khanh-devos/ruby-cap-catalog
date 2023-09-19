require 'securerandom'


class Item
    attr_reader :id, :type, :archived
    attr_accessor :genre, :author, :label, :published_date

    def initialize(type, published_date, genre = nil, author = nil, label = nil, archived: false)
        @id = rand 0..100
        @type = type

        @published_date = published_date
        @archived = archived

        if !genre.nil?
            @genre = genre.name
            genre.items << @id
        end

        if !author.nil?
            @author = "#{author.first_name} #{author.last_name}"
            author.items << @id
        end

        if !label.nil?
            @label = label.title
            label.items << @id
        end

    end

    private

    def can_be_archived?
        today = Time.now
        year, month, day = [today.year, today.month, today.day]
        point_of_10_years_algo = Time.new(year - 10, month, day)

        arr = @published_date.split(/-/, 3)
        pdate = Time.new(arr[0], arr[1], arr[2]) 

        (pdate < point_of_10_years_algo)
    end

    public 

    def move_to_archive
        if can_be_archived? then @archived = true end 
    end

    def add_label(label)
        label.add_item(self)
    end

end