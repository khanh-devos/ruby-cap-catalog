require 'date'

class Item

    def initialize(published_date, archived = false)
        @published_date = published_date
        @archived = 
    end


    def can_be_archived?()
        today = Time.now
        year, month, day = [today.year, today.month, today.day]
        point_of_10_years_algo = Time.new(year - 10, month, day)

        arr = @published_date.split(/-/, 3)
        pdate = Time.new(arr[0], arr[1], arr[2])        

        (pdate < point_of_10_years_algo)
    end

    def move_to_archive()
        if can_be_archived? then @archived = true end 
    end

end