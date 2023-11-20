require_relative 'app'

class Main
  def initialize
    @app = App.new
  end

  def main
    puts 'Welcome to our Catalog app'
    loop do
      display_menu
      choice = gets.chomp.to_i
      handle_choice(choice)
    end
  end

  def handle_choice(choice)
    case choice
    when 1 then @app.add_a_book
    when 2 then @app.add_a_album
    when 3 then @app.add_a_game
    when 4 then @app.list_all_books
    when 5 then @app.list_all_labels
    when 6 then @app.list_all_albums
    when 7 then @app.list_all_genres
    when 8 then @app.list_all_games
    when 9 then @app.list_all_authors
    when 10 then exit_app
    end
  end

  def display_menu
    puts ' '
    puts 'Please, choose an option by entering a number'
    puts '1. Add a book'
    puts '2. Add a music album'
    puts '3. Add a game'
    puts '4. List all books'
    puts '5. List all labels'
    puts '6. List all music albums'
    puts '7. List all genres'
    puts '8. List all games'
    puts '9. List all authors'
    puts '10. Exit'
  end

  def exit_app
    puts 'Thank you for using this app!'
    exit
  end
end

main_app = Main.new
main_app.main
