require_relative './handle_data'
require_relative '../classes/book'
require 'json'

class BooksApp
    attr_accessor :books

    def initialize
        @books = read_books
    end

    def list_books
        puts 'there is no book in the library' if @books.empty?
        @books.each_with_index do |book, index|
        puts " [Book]- Index: #{index},  Title: #{book.title}, Author: #{book.author}, Id: #{book.id}"
        end
    end

    def add_book
        puts 'Create a new book'
        print 'Enter book title: '
        title = gets.chomp
        print 'Enter author name: '
        author = gets.chomp
        book = Book.new(title, author)
        @books.push(book)
        save_books(@books)
        puts "Book with title '#{book.title}' added successfully"
    end
end
