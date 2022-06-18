require './rental'

class Book
  attr_accessor :title, :author
  attr_reader :id, :rentals

  def initialize(title, author)
    @id = Random.rand(1..99_999)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    Rental.new(date, self, person)
  end
end
