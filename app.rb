require './nameable'
require './person'
require './teacher'
require './student'
require './classroom'
require './book'
require './rental'
require 'json'

class App
  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def start_console
    puts '********** Welcome to the school library app **********'
    until list_options
      input = gets.chomp
      option(input)
    end
  end

  def list_books
    puts 'there is no book in the library' if @books.empty?
    @books.each_with_index do |book, index|
      puts " [Book]- Index: #{index},  Title: #{book.title}, Author: #{book.author}, Id: #{book.id}"
    end
  end

  def list_persons
    puts 'there is no person registred in the library' if @persons.empty?
    @persons.each_with_index do |person, index|
      puts "[#{person.class.name}] Index: #{index}, Name: #{person.name}, Age: #{person.age}, id: #{person.id} "
    end
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

  def create_student
    puts '********** Create a new student **********'
    print 'Enter student name: '
    name = gets.chomp
    print 'Enter student age: '
    age = gets.chomp.to_i
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase
    case parent_permission
    when 'y'
      classroom = 'classroom A'
      student = Student.new(age, classroom, name, parent_permission: true)
    when 'n'
      classroom = 'classroom B'
      student = Student.new(age, classroom, name, parent_permission: false)
    else
      puts 'Please enter y for yes or n for no.'
      create_student
    end
    @persons << student
    puts '********** Student created successfully **********'
  end

  def create_teacher
    puts '********** Create a new teacher **********'
    print 'Enter teacher name: '
    name = gets.chomp
    print 'Enter teacher age: '
    age = gets.chomp.to_i
    print 'Enter teacher specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @persons << teacher
    puts ''
    puts '********** Teacher created successfully **********'
  end

  def add_book
    puts 'Create a new book'
    print 'Enter book title: '
    title = gets.chomp
    print 'Enter author name: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts "Book with title '#{book.title}' added successfully"
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

  def save_books(file_name)
    bk = []
    @books.each do |book|
    bk.push({
        title: book.title,
        author: book.author
      })
    end
    File.write(file_name, JSON.generate(bk).to_s)
  end
end
