require_relative '../classes/student'

describe Student do
  before :each do
    @students = Student.new "age", "classroom", "name"
  end

  describe "#new" do
    it "Takes in three parameters and returns a student's object" do
      @students.should be_an_instance_of Student
    end
  end

  describe "#age" do
    it "Returns the correct students age" do
      @students.age.should eql "age"
    end
  end

  describe "#age" do
    it "Returns the correct students classroom" do
      @students.classroom.should eql "classroom"
    end
  end

  describe "#age" do
    it "Returns the correct students name" do
      @students.name.should eql "name"
    end
  end
end