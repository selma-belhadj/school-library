require 'json'
require_relative '../classes/book'
require_relative '../classes/person'

def initialize_files
  File.write('./data/books.json', '[]') unless File.exist?('./data/books.json')
  File.zero?('./data/books.json') && File.write('./data/books.json', '[]')

  File.write('./data/persons.json', '[]') unless File.exist?('./data/persons.json')
  File.zero?('./data/persons.json') && File.write('./data/persons.json', '[]')

  File.write('./data/rentals.json', '[]') unless File.exist?('./data/rentals.json')
  File.zero?('./data/rentals.json') && File.write('./data/rentals.json', '[]')
end

def save_books(books)
  bk = []
  books.each do |book|
    bk.push({
              title: book.title,
              author: book.author
            })
  end
  File.write('./data/books.json', JSON.generate(bk).to_s)
end

def read_books
  books = []
  JSON.parse(File.read('./data/books.json')).each do |book|
    books.push(Book.new(book['title'], book['author']))
  end
  books
end

def save_people(persons)
  ppl = []
  persons.each do |person|
    ppl << if person.instance_of? Student
             {
               role: person.class.name,
               name: person.name,
               age: person.age
             }
           elsif person.instance_of? Teacher
             {
               role: person.class.name,
               name: person.name,
               age: person.age,
               specialization: person.specialization
             }
           end
  end
  File.write('./data/persons.json', JSON.generate(ppl).to_s)
end

def read_person
  persons = []
  JSON.parse(File.read('./data/persons.json')).each do |person|
    persons << case person['role']
               when 'Student'
                 Student.new(person['role'], person['age'], person['name'])
               when 'Teacher'
                 Teacher.new(person['age'], person['specialization'], person['name'])
               end
  end
  persons
end
