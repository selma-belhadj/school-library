require './book'


class CreateBook
  attr_accessor :books
  def initialize
    @books = []
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
end