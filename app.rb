require_relative 'classes/book'
require_relative 'classes/item'
require_relative 'classes/label'
require_relative 'classes/music_album'
require_relative 'classes/genre'
require_relative 'classes/game'
require_relative 'classes/author'
require 'json'

class App
  def initialize
    @books = []
    @labels = []
    @albums = []
    @genres = []
    @games = []
    @authors = []
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

  def add_a_album
    puts 'Enter the album'
    print 'Enter Genre: '
    genre = gets.chomp
    genre = Genre.new(name: genre)
    print 'Is it on Spotify? (Y/N): '
    on_spotify = gets.chomp.upcase == 'Y'
    print 'Enter date published: '
    date_published = gets.chomp
    album = MusicAlbum.new(on_spotify, date_published)
    @albums.push(album)
    @genres.push(genre)
    puts 'Album added successfully'
  end

  def add_a_game
    puts 'Enter authors first name'
    first_name = gets.chomp
    puts 'Enter authors last name'
    last_name = gets.chomp
    puts 'Enter the pusblish date of the game (YYYY-MM-DD)'
    publish_date = gets.chomp
    puts 'Enter the game is multiplayer? (Y/N): '
    multiplayer = gets.chomp
    puts 'Enter the the game last played at (YYYY-MM-DD)'
    last_played_at = gets.chomp

    author = Author.new(first_name, last_name)
    game = Game.new(publish_date, multiplayer, last_played_at)

    @authors.push(author)
    @games.push(game)

    puts 'Game created successfully'
  end

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

  def list_all_albums
    @albums.each do |album|
      puts "ID: #{album.id}, On Spotify: #{album.publish_date}, Published date: #{album.on_spotify}"
    end
  end

  def list_all_genres
    if @genres.empty?
      puts 'No genres added yet'
    else
      @genres.each do |genre|
        puts "ID: #{genre.id}, Name: #{genre.name}"
      end
    end
  end

  def list_all_games
    @games.each do |game|
      puts "publish date: #{game.publish_date}, multiplayer: #{game.multiplayer}, last played: #{game.last_played_at}"
    end
  end

  def list_all_authors
    @authors.each do |author|
      puts "ID: #{author.id}, First Name: #{author.first_name}, Last Name: #{author.last_name}"
    end
  end

  def save_data
    albums = MusicAlbum.all.map { |album| { on_spotify: album.publish_date, publish_date: album.on_spotify, id: album.id } }
    genres = Genre.all.map do |genre| 
      { name: genre.name, id: genre.id }
    end

    music_album_json = albums.to_json
    genre_json = genres.to_json
  
    folder_path = 'JSON/'
    album_json_file = folder_path + 'music_album.json'
    genre_json_file = folder_path + 'genre.json'
  
    File.write(album_json_file, music_album_json)
    File.write(genre_json_file, genre_json)
  end

  def load_data
    album_json_path = 'JSON/music_album.json'
  
    if File.exist?(album_json_path)
      data = JSON.parse(File.read(album_json_path))
      @albums = data.map do |album|
        MusicAlbum.new(album['on_spotify'], album['publish_date'])
      end
      puts 'Albums loaded successfully'
    else
      puts 'No data to load'
    end

    genre_json_path = 'JSON/genre.json'
    if File.exist?(genre_json_path)
      data = JSON.parse(File.read(genre_json_path))
      @genres = data.map do |genre|
        Genre.new(genre['name'])
      end
      puts 'Genres loaded successfully'
    else
      puts 'No data to load'
    end
  end
end
