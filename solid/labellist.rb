require_relative './validation'
require_relative '../classes/label'

class LabelList
    attr_accessor :list

    def initialize
        @list = [] # default
        @input = InputValidation.new
    end
    
    def show
        @list.each_with_index do |item, i|
            puts "#{i+1} #{item.title}  "
        end
    end

    def label_attr
        @input.input_string('Add new label:')
    end

    def new_or_old_label?(title)
        check_list = @list.map { |item| item.title }

        if check_list.include?(title.upcase)
            return @list.find { |e| e.title == title.upcase }
        else
            label = Label.new(title)
            # Add a new label to the @list
            @list << label
            puts "New label added successfully"
            return label
        end
    end
    
    def add_label_for(new_item)
        title = label_attr
        label = new_or_old_label?(title)

        new_item.add_label(label)
    end

    def select_create_label_for(new_item)
        show
        print ('Choose the label by index (or enter to create a new Label): ')
        index = gets.chomp.to_i
        
        if !index.zero?
            # old label in the list
            label = @list[index - 1]
            new_item.add_label(label)
        else
            # Add new label for item
            add_label_for(new_item)
        end
        
        puts "Item added new label successfully"
    end

end