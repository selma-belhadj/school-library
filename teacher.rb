require './person'

class Teacher < Person
  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

# Create Objects
teacher_one = Teacher.new(27, 'specialization A', 'Isma')
teacher_two = Teacher.new(4, 'specialization B', 'Manel', parent_permission: false)
teacher_three = Teacher.new(20, 'specialization C', 'Sarah', parent_permission: false)
teacher_four = Teacher.new(15, 'specialization D', 'Sissa')

# Call Methods
puts "teacher_one can use services: #{teacher_one.can_use_services?}"
puts "teacher_two can use services: #{teacher_two.can_use_services?}"
puts "teacher_three can use services: #{teacher_three.can_use_services?}"
puts "teacher_four ca use services: #{teacher_four.can_use_services?}"
