require_relative './handle_data'
require_relative '../classes/rental'
require_relative '../classes/person'
require_relative '../classes/book'
require_relative './books_app'
require_relative './persons_app'
require 'json'

class RentalsApp
  attr_accessor :rentals, :books, :persons

  def initialize(books, persons)
    @books = books
    @persons = persons
    @rentals = JSON.parse(File.read('./data/rentals.json'))
  end

  def add_rental
    puts '********** Create a new rental **********'
    puts 'Select which book you want to rent by entering its index: '
    book_index = gets.chomp.to_i
    puts 'Select a person from the list by its index: '
    person_index = gets.chomp.to_i
    puts 'Enter date of rentals: [format: yyyy-mm-dd]: '
    date = gets.chomp.to_s
    rental = Rental.new(date, @books[book_index], @persons[person_index])
    rtl = {
      date: rental.date,
      name: rental.person.name,
      title: rental.book.title,
      author: rental.book.author,
      person_id: rental.person.id
    }
    @rentals << rtl
    File.write('./data/rentals.json', JSON.generate(@rentals))
    puts '********** Rental created successfully **********'
  end
end
