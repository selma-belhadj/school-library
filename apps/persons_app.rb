require_relative './handle_data'
require_relative '../classes/person'
require_relative '../classes/teacher'
require_relative '../classes/student'
require 'json'

class PersonApp
  attr_accessor :persons

  def initialize
    @persons = read_person
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
    @persons.push(student)
    save_people(@persons)
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
    @persons.push(teacher)
    save_people(@persons)
    puts ''
    puts '********** Teacher created successfully **********'
  end
end
