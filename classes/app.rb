require_relative 'classroom'
require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require 'json'

class App
  def self.list_books
    Book.all.map { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def self.list_persons
    Person.all.map { |person| puts "ID: #{person.id} , Name: #{person.name}, Age: #{person.age}" }
  end

  def self.create_classroom(label)
    Classroom.new(label)
  end

  def self.create_person
    print ' Do you want to create a student (1) or a teacher (2) ? [input the number] :'
    person_type = gets.chomp.to_i
    case person_type
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid choice. Please enter a valid option.'
      execute(3)
    end
    puts 'Person created successfully'
  end

  def self.create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.to_s
    print 'Has parent permission ? [Y/N]: '
    choice = gets.chomp
    if %w[Y y].include?(choice)
      Student.new(age, name, parent_permission: true)
    elsif %w[N n].include?(choice)
      Student.new(age, name, parent_permission: false)
    end
  end

  def self.create_teacher
    print 'Age: '
    teacher_age = gets.chomp.to_i
    print 'Name: '
    teacher_name = gets.chomp.to_s
    print 'Specialization: '
    specialization = gets.chomp.to_s
    Teacher.new(specialization, teacher_age, teacher_name)
  end

  def self.create_book
    print 'Title: '
    title = gets.chomp.to_s
    print 'Author: '
    author = gets.chomp.to_s
    Book.new(title, author)
    puts 'Book created successfully'
  end

  def self.create_rental
    puts 'Select a book from the following list by number'
    Book.all.map.with_index do |book, index|
      puts " (#{index + 1}) Title: #{book.title}, Author: #{book.author}"
    end
    rental_book_index = gets.chomp.to_i
    rental_book = Book.all[rental_book_index - 1]

    puts 'Select a person from the folowing list by number(not id)'
    Person.all.map.with_index do |person, index|
      puts "(#{index + 1}), Name: #{person.name}, Age: #{person.age}"
    end
    rental_person_index = gets.chomp.to_i
    rental_person = Person.all[rental_person_index - 1]

    print 'Date: '
    date = gets.chomp
    Rental.new(date, rental_person, rental_book)
    puts 'Rental created successfully'
  end

  def self.list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    person = Person.all.select { |x| x.id == id }[0]

    if person
      puts 'Rentals:'
      person.rental.each { |rental| puts "Date: #{rental.date}, Book: #{rental.book.title}" }
    else
      puts 'Person with the given ID does not exist '
    end
  end

  def self.save_data
    books = Book.all.map { |book| { title: book.title, author: book.author } }
    people = Person.all.map do |person|
      { id: person.id, age: person.age, name: person.name, rental: [] }
    end
    rentals = Rental.all.map do |rental|
      { date: rental.date, person: { id: rental.person.id, age: rental.person.age, name: rental.person.name },
        book: { author: rental.book.author, title: rental.book.title } }
    end

    # Convert the arrays to JSON strings
    books_json = books.to_json
    people_json = people.to_json
    rentals_json = rentals.to_json

    # Save data in the files
    File.write('books.json', books_json)
    File.write('people.json', people_json)
    File.write('rentals.json', rentals_json)

    puts 'Save successfully!'
  end
end
