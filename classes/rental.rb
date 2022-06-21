class Rental
  attr_accessor :date
  attr_reader :person, :book

  def initialize(date, book, person)
    @date = date
    @person = person
    person.rentals << self
    @book = book
    book.rentals << self
  end

  def rental_info
    "#{@person.name} rents #{@book.title} on #{@date} "
  end
end
