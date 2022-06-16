class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..99_999)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_accessor :name, :age
  attr_reader :id

  def can_use_services?
    return true if of_age? || @parent_permission

    false
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end
end

# Create Objects
person_one = Person.new(27, 'Isma')
person_two = Person.new(4, 'Manel', parent_permission: false)
person_three = Person.new(20, 'Sarah', parent_permission: false)
person_four = Person.new(15, 'Sissa')

# Call Methods
puts "person_one can use services: #{person_one.can_use_services?}"
puts "person_two can use services: #{person_two.can_use_services?}"
puts "person_three can use services: #{person_three.can_use_services?}"
puts "person_four can use services: #{person_four.can_use_services?}"
