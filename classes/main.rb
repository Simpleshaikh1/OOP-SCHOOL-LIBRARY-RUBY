require_relative 'app'
require_relative 'execute'
require 'json'

class Main
  def display_ui
    puts 'Please choose an option by entering a number:'
    load_data
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Save data And Exit'
    user_choice = gets.chomp.to_i
    puts user_choice
    Execute.new(user_choice).execute
  end

  def load_data
    display_books
    display_people
    display_rentals
  end

  private

  def load_json_file(filename)
    if File.exist?(filename)
      data = File.read(filename)
      JSON.parse(data) unless data.empty?
    end
  end

  def display_books
    books = load_json_file('books.json')
    if books
      puts 'Books:'
      books.each { |book| display_book(book) }
    else
      puts 'No books available.'
    end
  end

  def display_book(book)
    puts "Title: #{book['title']} Author: #{book['author']}"
  end

  def display_people
    people = load_json_file('people.json')
    if people
      puts 'People:'
      people.each { |person| display_person(person) }
    else
      puts 'No people available.'
    end
  end

  def display_person(person)
    puts "ID: #{person['id']} Age: #{person['age']} Name: #{person['name']} Rental: #{person['rental']}"
  end

  def display_rentals
    rentals = load_json_file('rentals.json')
    if rentals
      puts 'Rentals:'
      rentals.each { |rental| display_rental(rental) }
    else
      puts 'No rentals available.'
    end
  end

  def display_rental(rental)
    date = rental['date']
    person = rental['person']
    book = rental['book']

    puts "Date: #{date}"
    puts "Person ID: #{person['id']} Age: #{person['age']} Name: #{person['name']}"
    puts "Book Title: #{book['title']} Author: #{book['author']}"
    puts '----------'
  end
end

puts 'Welcome to School Library App!'
Main.new.display_ui
