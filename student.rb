require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name, parent_permission:true,id: nil)
    super(age, name, parent_permission:parent_permission,id:id)
    @classroom = classroom
  end

  

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def to_hash
    hash = {}
    hash[:class] = self.class
    hash[:age] = @age
    hash[:name] = @name
    hash[:parent_permission] = @parent_permission
    hash[:id] = @id
    hash
  end

  def self.create_from_hash(hash)
    Student.new(hash['age'],nil, hash['name'], parent_permission: hash['parent_permission'], id: hash['id'])
  end
end
