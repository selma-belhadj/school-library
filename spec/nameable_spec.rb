require_relative '../classes/nameable'
require_relative '../classes/person'

describe Book do
  context 'Test for Nameable class' do
    person = Person.new(30, 'kaoutherbelhadj')
    person.correct_name
    capitalized_person = CapitalizeDecorator.new(person)
    capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)

    it 'is this instance of Capitalize Decorator Book' do
      expect(capitalized_person).to be_an_instance_of(CapitalizeDecorator)
    end

    it 'if method "correct_name of the Nameable Decorator" returns exactly the same name' do
      expect(person.correct_name).to eq('kaoutherbelhadj')
    end

    it 'if method "correct_name of the Capitalize Decorator" works correctly' do
      expect(capitalized_person.correct_name).to eq('Kaoutherbelhadj')
    end

    it 'if method "correct_name of the Trimmer Decorator" works correctly' do
      expect(capitalized_trimmed_person.correct_name).to eq('Kaoutherbe')
    end
  end
end
