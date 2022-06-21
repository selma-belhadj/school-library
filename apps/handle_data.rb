require 'json'
require './classes/book'

def initialize_files
    File.write('./data/books.json', []) unless File.exist?('./data/books.json')
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