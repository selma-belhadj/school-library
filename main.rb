require './app'

def main
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
end

def option(input)
  case input
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
    save_books('./data/books.json')
    save_people('./data/persons.json')
    exit_msg
  else
    puts 'Please enter a number between 1 and 7.'
  end
end

def exit_msg
  puts ' '
  puts 'Thank you for using this App'
  exit(true)
end

main
