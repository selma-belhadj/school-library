require './app'

def main
    puts 'Welcome to the school library app'
    app = App.new
    app.start_console
end

def list_options
    puts
    puts " Please choose among the options below by pressing its corresponding number:"
    puts '[1] List all books'
    puts '[2] List all people'
    puts '[3] Add a person'
    puts '[4] Add a book'
    puts '[5] Add a rental'
    puts '[6] List all rentals for a given person id'
    puts '[7] Exit'
    gets.chomp
end

def choose_option
    case list_options
    when '1'
        list_books
    when '2'
        list_persons
    when '3'
        add_person
    when '4'
        add_book
    when '5'
        add_rental
    when '6'
        list_filtred_rentals
    when '7' 
        puts 'Thank you for using the app!'
    else
        puts 'Please enter a number between 1 and 7.'
    end
    choose_option
end

main