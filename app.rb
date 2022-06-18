require './nameable'
require './person'
require './teacher'
require './student'
require './classroom'
require './book'
require './rental'

class App
  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def start_console
    choose_option
  end

  def list_books
    puts 'there is no book in the library' if @books.empty?
    @books.each { |book| puts "[Book] Title:#{book.title}, Author:#{book.title}" }
  end

  def list_persons
    puts 'there is no person registred in the library' if @persons.empty?
    @persons.each { |person| puts "[#{person.class.name}] Title:#{person.name}, Age:#{person.age}, id:#{person.id} " }
  end

  def add_person
    print 'To create a student, press 1, to create a teacher, press 2 : '
    option = gets.chomp
    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid input. Try again'
    end
  end

  def add_book
    puts 'Create a new book'
    print 'Enter book title:'
    title = gets.chomp
    print 'Enter author name:'
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts "Book with title '#{book.title}' added successfully"
  end

  def add_rental
    puts 'add rental'
  end

  def list_filtred_rentals
    puts 'list_filtred_rentals'
  end
end
