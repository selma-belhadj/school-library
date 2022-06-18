require './person'
require './student'
require './classroom'
# # Create Objects
# person_one = Person.new(27, 'Isma')
# person_two = Person.new(4, 'Manel', parent_permission: false)
# person_three = Person.new(20, 'Sarah', parent_permission: false)
# person_four = Person.new(15, 'Sissa')

# # Call Methods
# puts "person_one can use services: #{person_one.can_use_services?}"
# puts "person_two can use services: #{person_two.can_use_services?}"
# puts "person_three can use services: #{person_three.can_use_services?}"
# puts "person_four can use services: #{person_four.can_use_services?}"

# person = Person.new(22, 'maximilianus')
# puts person.correct_name
# puts capitalized_person = CapitalizeDecorator.new(person)
# puts capitalized_person.correct_name
# puts capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
# puts capitalized_trimmed_person.correct_name

# create classroom objects
classroom1 = Classroom.new('A')
classroom2 = Classroom.new('B')
classroom3 = Classroom.new('C')

# create student objects
student_one = Student.new(27, classroom1, 'Isma')
student_two = Student.new(4, classroom2, 'Manel', parent_permission: false)
student_three = Student.new(20, classroom3, 'Sarah', parent_permission: false)
student_four = Student.new(15, classroom1, 'Sissa')

# adding students to their classes
classroom1.add_student(student_one)
classroom1.add_student(student_four)
classroom2.add_student(student_two)

puts('students in classroom A', classroom1.students)
puts classroom1.students[0].name 
puts classroom1.students[1].name 

# Results
puts('students in classroom B',classroom2.students)
puts classroom2.students[0].name

puts('Student one belongs to classroom with label', student_one.classroom.label)
puts('Student four belongs to classroom with label', student_four.classroom.label)
puts('Student two belongs to classroom with label', student_two.classroom.label)

puts('Number of students in Classroom A: ',classroom1.students.count)
puts('Number of students in Classroom B: ',classroom2.students.count)
puts('Number of students in Classroom C: ',classroom3.students.count)
