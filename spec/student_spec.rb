require_relative '../classroom'
require_relative '../student'

describe Student do
  context 'Given age and name' do
    it 'creates a new student with the correct parameters' do
      age = 16
      name = 'Dagic'
      student = Student.new(age, 'section-a', name)

      expect(student.age).to equal(age)
      expect(student.name).to eql(name)
      expect(student.id).to be_between(1, 1000)
      expect(student.rentals).to be_empty
    end
  end

  before :each do
    @student = Student.new(17, 'cs-1', 'Jeff')
  end

  context 'Given a Student' do
    it 'ask person to play hookey' do
      expect(@student.play_hooky).to eql("¯\(ツ)/¯")
    end
  end

  context 'Given a Student' do
    it 'generate a hash representation from it' do
      hash = @student.to_hash

      expect(hash[:class]).to eql(@student.class)
      expect(hash[:age]).to eql(@student.age)
      expect(hash[:name]).to eql(@student.name)
      expect(hash[:id]).to eql(@student.id)
    end
  end

  context 'Given a hash representation' do
    it 'generate a Student object from it' do
      hash = { 'class' => 'Student', 'age' => 17, 'name' => 'Jeff', 'parent_permission' => true, 'id' => 897 }
      student = Student.create_from_hash(hash)

      expect(student.name).to equal(hash['name'])
      expect(student.age).to equal(hash['age'])
      expect(student.rentals).to be_empty
    end
  end
end