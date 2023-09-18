require_relative '../classes/game/author'

class AuthorManager
  attr_reader :all_authors

  def initialize
    @all_authors = []
  end

  def list_all_authors
    if @all_authors.empty?
      puts "It seems we don't have any authors."
    else
      puts 'Here is the Author List ✍️'
      @all_authors.each do |author|
        puts "First name: \"#{author.first_name}\", Last name: \"#{author.last_name}\""
      end
    end
  end

  def add_author(item, first_name, last_name)
    author = Author.new(first_name, last_name)
    author.add_item(item)
    @all_authors << author
  end
end
