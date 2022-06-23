require_relative '../classes/teacher'

describe Teacher do
  before :each do
    @teachers = Teacher.new 'age', 'specialization', 'name'
  end

  describe '#new' do
    it 'Takes in three parameters and returns a teacher s object' do
      @teachers.should be_an_instance_of Teacher
    end
  end

  describe '#age' do
    it 'Returns the correct teachers age' do
      @teachers.age.should eql 'age'
    end
  end

  describe '#specialization' do
    it 'Returns the correct teachers specialization' do
      @teachers.specialization.should eql 'specialization'
    end
  end

  describe '#name' do
    it 'Returns the correct teachers name' do
      @teachers.name.should eql 'name'
    end
  end
end
