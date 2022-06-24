require_relative '../classes/person'

describe Person do
  before :each do
    @persons = Person.new 18, 'Nemwel'
  end

  describe '#new' do
    it 'Takes in three parameters and returns a person object' do
      @persons.should be_an_instance_of Person
    end
  end

  describe '#age' do
    it 'Returns the correct age' do
      @persons.age.should eql 18
    end
  end

  describe '#name' do
    it 'Returns the correct name' do
      @persons.name.should eql 'Nemwel'
    end
  end

  describe '#age' do
    it 'Checks whether person can use services' do
      @persons.can_use_services?.should eql true
    end
  end

  describe '#name' do
    it 'Checks whether the returned name is correct' do
      @persons.correct_name.should eql 'Nemwel'
    end
  end

  # Test fails because I am calling a private method
  # Passes only when I comment the private tag in person.rb
  # describe '#age' do
  #   it 'Checks whether person is of age' do
  #     @persons.of_age?.should eql true
  #   end
  # end
end
