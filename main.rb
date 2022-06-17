require './person'

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

person = Person.new(22, 'maximilianus')
puts person.correct_name
puts capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
puts capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
