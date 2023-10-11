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

  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  def load_data
    if File.exist?('./class/books.json')
      books_data = File.read('./class/books.json')
      if books_data.empty?
        puts 'No books available.'
      else
        books = JSON.parse(books_data)
        puts 'Books:'
        books.each do |book|
          puts "Title: #{book['title']} Author: #{book['author']}"
        end
      end
    else
      puts 'Books file does not exist.'
    end

    if File.exist?('./class/people.json')
      people_data = File.read('./class/people.json')
      if people_data.empty?
        puts 'No person available'
      else
        people = JSON.parse(people_data)
        puts 'People:'
        people.each do |person|
          puts "ID: #{person['id']} Age: #{person['age']} Name: #{person['name']} Rental: #{person['rental']}"
        end
      end
    else
      puts 'Person file does not exist.'
    end

    if File.exist?('./class/rentals.json')
      rental_data = File.read('./class/rentals.json')
      if rental_data.empty?
        puts 'No Rentals available'
      else
        rentals = JSON.parse(rental_data)
        puts 'Rentals:'
        rentals.each do |rental|
          date = rental['date']
          person = rental['person']
          book = rental['book']

          puts "Date: #{date}"
          puts "Person ID: #{person['id']}"
          puts "Person Age: #{person['age']}"
          puts "Person Name: #{person['name']}"
          puts "Book Author: #{book['author']}"
          puts "Book Title: #{book['title']}"
          puts '----------'
        end
      end
    else
      puts 'Rental file does not exist.'
    end
  end

  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
end

puts 'Welcome to School Library App!'
Main.new.display_ui
