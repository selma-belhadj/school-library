require './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    @classroom = classroom
    super(age, name, parent_permission: parent_permission)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end

# Create Objects
# student_one = Student.new(27, 'classroom 1', 'Isma')
# student_two = Student.new(4, 'classroom 2', 'Manel', parent_permission: false)
# student_three = Student.new(20, 'classroom 2', 'Sarah', parent_permission: false)
# student_four = Student.new(15, 'classroom 3', 'Sissa')

# Call Methods
# puts "student_one can use services: #{student_one.can_use_services?}"
# puts "student_two can use services: #{student_two.can_use_services?}"
# puts "student_three can use services: #{student_three.can_use_services?}"
# puts "student_four ca use services: #{student_four.can_use_services?}"

# puts "student_one play hooky: #{student_one.play_hooky}"
# puts "student_two play hooky: #{student_two.play_hooky}"
