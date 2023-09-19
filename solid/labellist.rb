require_relative 'validation'
require_relative '../classes/label'
require_relative '../serializers/serializearray'

class LabelList
  include SerializationArray
  attr_accessor :list

  def initialize
    @list = [] # default
    @input = InputValidation.new
  end

  def show
    @list.each_with_index do |item, i|
      puts "#{i + 1} : \"#{item.title}\"  "
    end
  end

  def label_attr
    @input.input_string('Add new label:')
  end

  def new_or_old_label?(title)
    check_list = @list.map(&:title)

    return @list.find { |e| e.title == title.upcase } if check_list.include?(title.upcase)

    label = Label.new(title)
    # Add a new label to the @list
    @list << label
    puts 'New label added successfully'
    label
  end

  def add_label_for(new_item)
    title = label_attr
    label = new_or_old_label?(title)

    new_item.add_label(label)
  end

  def select_create_label_for(new_item)
    show
    print('Select label by index (0: create a new label or enter to skip): ')
    input = gets.chomp.strip

    return if input.empty? # skipping

    index = input.to_i
    if index.zero?
      # Add new label for item
      add_label_for(new_item)
    else
      # old label in the list
      label = @list[index - 1]
      new_item.add_label(label)
    end

    puts 'Item added new label successfully'
  end

  # SERIALIZATION
  def take_array
    @list
  end

  def create_item
    Label.new('fake')
  end

  def add_list(arr)
    @list = arr
  end
end
