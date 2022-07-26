require_relative './jsonHandler'
require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'

class DataHandler
  def initialize(file_name)
    @file_name = file_name
  end

  def read_data
    File.exist?(@file_name) ? JsonHandler.parse_json(File.read(@file_name)) : []
  end

  def write_data(data)
    File.write(@file_name, JsonHandler.generate_json(data))
  end

  def objects_to_hash_array(array_of_objects)
    array_of_objects.map(&:to_hash)
  end

  def objects_from_array(array_of_hashes)
    array_of_hashes.map do |hash|
      class_name = hash['class']
      case class_name
      when 'Student'
        Student.create_from_hash(hash)
      when 'Teacher'
        Teacher.create_from_hash(hash)
      when 'Book'
        Book.create_from_hash(hash)
      end
    end
  end

  def rentals_from_array(array_of_rentals, books, people)
    array_of_rentals.map do |hash|
      person = people.find do |p|
        puts "#{p.id} is #{hash['person_id']} "
        p.id == hash['person_id']
      end
      book = books.find { |b| b.id == hash['book_id'] }
      puts person, book
      Rental.new(hash['date'], person, book)
    end
  end
end
