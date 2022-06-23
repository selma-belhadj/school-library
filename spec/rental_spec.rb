require_relative '../classes/rental'
require_relative '../classes/book'
require_relative '../classes/student'

describe Rental do
  before :each do
    @book = Book.new 'Title', 'Author'
    @student = Student.new 'age', 'classroom', 'name'
    @rentals = Rental.new 'date', @book, @student
  end

  describe '#new' do
    it 'Takes in three parameters and returns a rental s object' do
      @rentals.should be_an_instance_of Rental
    end
  end

  describe '#date' do
    it 'Makes sure the returned date is the same as the one borrowed' do
      @rentals.date.should eql 'date'
    end
  end
end
