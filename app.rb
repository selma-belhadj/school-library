require './apps/books_app'
require './apps/persons_app'
require './apps/rentals_app'
require './classes/nameable'
require './classes/person'
require './classes/teacher'
require './classes/student'
require './classes/classroom'
require './classes/book'
require './classes/rental'

class App
  attr_accessor :books, :persons

  def initialize
    @books = BooksApp.new
    @persons = PersonApp.new
    @rentals = RentalsApp.new(@books.books, @persons.persons)
  end

  def list_options
    puts
    puts ' Please choose among the options below by pressing its corresponding number:'
    puts '[1] List all books'
    puts '[2] List all people'
    puts '[3] Add a person'
    puts '[4] Add a book'
    puts '[5] Add a rental'
    puts '[6] List all rentals for a given person id'
    puts '[7] Exit'
  end

  def exit_msg
    puts ' '
    puts 'Thank you for using this App'
    exit(true)
  end

  def option(input)
    case input
    when '1'
      @books.list_books
    when '2'
      @persons.list_persons
    when '3'
      @persons.add_person
    when '4'
      @books.add_book
    when '5'
      @rentals.add_rental
    when '6'
      @rentals.list_filtred_rentals
    when '7'
      exit_msg
    else
      puts 'Please enter a number between 1 and 7.'
    end
  end

  def start_console
    puts '********** Welcome to the school library app **********'
    until list_options
      input = gets.chomp
      option(input)
    end
  end
end
