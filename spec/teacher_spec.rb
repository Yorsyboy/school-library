require_relative '../classroom'
require_relative '../teacher'

describe Teacher do
  context 'Given age, name and specialization' do
    it 'creates a new Teacher with the correct parameters' do
      age = 44
      specialization = 'Teaching'
      name = 'Jeff'
      teacher = Teacher.new(age, name, specialization)

      expect(teacher.age).to equal(age)
      expect(teacher.name).to eql(name)
      expect(teacher.id).to be_between(1, 1000)
      expect(teacher.rentals).to be_empty
    end
  end

  before :each do
    @teacher = Teacher.new(37, 'Dagic', 'Teaching')
  end

  context 'Given a Teacher' do
    it 'check if the teacher can use services' do
      expect(@teacher.can_use_services?).to be_truthy
    end
  end

  context 'Given a Teacher' do
    it 'generate a hash representation from it' do
      hash = @teacher.to_hash

      expect(hash[:class]).to eql(@teacher.class)
      expect(hash[:age]).to eql(@teacher.age)
      expect(hash[:name]).to eql(@teacher.name)
      expect(hash[:id]).to eql(@teacher.id)
    end
  end
end