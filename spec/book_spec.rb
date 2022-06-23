require_relative '../classes/book'
require_relative '../classes/person'

describe Book do
  context 'Test for Book class' do
    before(:context) do
      title = 'How to Learn'
      author = 'Sarah B'
      @book = Book.new(title, author)
    end

    it 'is this instance of class Book' do
      expect(@book).to be_an_instance_of(Book)
    end

    it 'the title of the created object is How to learn' do
      expect(@book.title).to eq('How to Learn')
    end

    it 'the author of the created object is Sarah B' do
      expect(@book.author).to eq('Sarah B')
    end

    it 'the rentals of the created book must be empty' do
      expect(@book.rentals).to eql []
    end

    it 'create a rental ' do
      date = '12-12-2020'
      @person = Person.new(27, 'Sarah')
      expect(@book.rentals.length).to eql(0)
      @book.add_rental(date, @person)
      expect(@book.rentals.length).to eql(1)
    end
  end
end
