require_relative 'classes/book'
require_relative 'classes/item'
require_relative 'classes/label'

class App
  def initialize
    @books = []
    @labels = []
  end

  def add_a_book
    puts 'Enter the title of the book:'
    title = gets.chomp
    puts 'Enter the color of the book:'
    color = gets.chomp
    puts 'Enter the publish date of the book (YYYY-MM-DD)'
    publish_date = gets.chomp
    puts 'Enter the publisher of the book:'
    publisher = gets.chomp

    cover_state = sort_cover_state

    label = Label.new(title, color)
    book = Book.new(publish_date, publisher, cover_state)

    @books.push(book)
    @labels.push(label)

    puts 'Book added successfully'
  end

  def sort_cover_state
    loop do
      puts 'Enter the cover state of the book (GOOD or BAD): '
      cover_state = gets.chomp.upcase
      return cover_state if %w[GOOD BAD].include?(cover_state)

      puts 'Invalid cover state. Please enter either GOOD or BAD.'
    end
  end

  def add_a_album; end

  def add_a_game; end

  def list_all_books
    @books.each do |book|
      puts "Publisher: #{book.publisher}, Published date: #{book.publish_date}, Cover state: #{book.cover_state}"
    end
  end

  def list_all_labels
    @labels.each do |label|
      puts "ID: #{label.id}, Title: #{label.title}, Color: #{label.color}"
    end
  end

  def list_all_albums; end

  def list_all_genres; end

  def list_all_games; end

  def list_all_authors; end
end
