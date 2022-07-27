require_relative './decorator'

class Person < Nameable
  attr_accessor :name, :age, :rentals, :id

  def initialize(age, name = 'Unknown', parent_permission: true, id: nil)
    super()
    @id = id || Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission == true
  end

  def add_rental(rental)
    @rentals.push(rental)
  end

  def of_age?
    @age >= 18
  end
end
