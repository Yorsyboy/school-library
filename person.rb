require_relative './decorator'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..100)
    @name
    @age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  def can_use_services?
    is_of_age? || @parent_permission == true
  end

  def correct_name
    @name
  end

  def add_rental(book)
    Rental.new(date, self, book)
  end

  private

  def of_age?
    @age >= 18
  end
end
