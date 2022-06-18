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
        @people = []
        @rentals = []
    end

    def start_console
        choose_option
    end

    def list_books
        puts 'list_books'
    end

    def list_persons
        puts 'list_persons'
    end

    def add_person
        puts 'add_person'
    end

    def add_book
        puts 'add_book'
    end

    def add_rental
        puts 'add_rental'
    end

    def list_filtred_rentals
        puts 'list_filtred_rentals'
    end
end
  

 