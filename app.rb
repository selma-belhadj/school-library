require './apps/books_app'
require './apps/persons_app'
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
    @rentals = []
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
      add_rental
    when '6'
      list_filtred_rentals
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

  def add_rental
    puts '********** Create a new rental **********'
    puts 'Select which book you want to rent by entering its index: '
    list_books
    book_index = gets.chomp.to_i
    puts 'Select a person from the list by its index: '
    list_persons
    person_index = gets.chomp.to_i
    puts 'Enter date of rentals: [format: yyyy-mm-dd]: '
    date = gets.chomp.to_s
    rental = Rental.new(date, @books[book_index], @persons[person_index])
    @rentals << rental
    puts ''
    puts "Book #{@books[book_index].title} has been rented to #{@persons[person_index].name} on date #{date} "
    puts '********** Rental created successfully **********'
  end

  def list_filtred_rentals
    puts 'there is no person registred in the library so there is no rental' if @persons.empty?
    puts 'To see person rentals enter the person ID: '
    list_persons
    person_id = gets.chomp.to_i
    puts 'Rented Books:'
    @rentals.each do |rental|
      if rental.person.id == person_id
        puts "Book #{rental.book.title} has been rented to #{rental.person.name} on date #{rental.date}"
      end
    end
  end
end
