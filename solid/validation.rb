require 'date'

class InputValidation
    private
  
    def show_phrases(phrase)
      print "#{phrase} "
    end
  
    public
  
    def input_positive(phrase)
      num = 0
      until num.positive?
        show_phrases(phrase)
        num = gets.chomp.to_i
        puts 'a positive num please' unless num.positive?
      end
      num
    end
  
    def input_string(phrase)
      str = ''
      until str.strip.length.positive?
        show_phrases(phrase)
        str = gets.chomp.strip[0, 20]
      end
      str
    end
  
    def input_yes_no(phrase)
      show_phrases(phrase)
      gets.chomp[0, 1].downcase != 'n'
    end

    def input_date(phrase)
      data = nil
      
      until !data.nil?
        show_phrases(phrase)
        str = gets.chomp.strip
        arr = str.split(/-/, 3).map(&:to_i)
        
        if arr.length == 3 && arr[0]>100 && arr[1].positive? && arr[1]<13 && arr[2].positive? && arr[2]<32

          data = Date.new(arr[0], arr[1], arr[2])
        end
      end
      data
    end
  end
  

