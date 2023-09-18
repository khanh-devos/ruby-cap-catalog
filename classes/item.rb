require 'securerandom'


class Item
    attr_reader :published_date, :id
    attr_accessor :archived

    def initialize(published_date, archived = false)
        @id = SecureRandom.hex
        @published_date = published_date
        @archived = archived
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

end