class Book
  attr_accessor :title, :author, :rentals
  attr_reader :id

  def initialize(title, author, id = nil)
    @id=id || Random.rand(1..1000)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    @rentals << Rental.new(date, self, person)
  end
  def to_hash
    hash = {}
    hash[:class] = self.class
    hash[:title] = @title
    hash[:author] = @author
    hash[:id] = @id
    hash
  end

  def self.create_from_hash(hash)
    Book.new(hash['title'], hash['author'], id: hash['id'])
  end
end
