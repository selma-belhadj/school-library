require './app'

def main
  puts '********** Welcome to the school library app **********'
  app = App.new
  app.start_console
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
  gets.chomp
end

def option
  case list_options
  when '1'
    list_books
    option
  when '2'
    list_persons
    option
  when '3'
    add_person
    option
  when '4'
    add_book
    option
  when '5'
    add_rental
    option
  when '6'
    list_filtred_rentals
    option
  when '7'
    puts 'Thank you for using this app!'
  else
    puts 'Please enter a number between 1 and 7.'
    option
  end
end

main
