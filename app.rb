require_relative './book'
require_relative './student'
require_relative './teacher'
require_relative './rental'

require_relative './datahandler'
require_relative './classroom'

class App
  attr_accessor :books, :people

  def initialize
    @people_storage = DataHandler.new('people.json')
    @books_storage = DataHandler.new('books.json')
    @rentals_storage = DataHandler.new('rentals.json')
    @people = @people_storage.objects_from_array(@people_storage.read_data)
    @books = @books_storage.objects_from_array(@books_storage.read_data)
    @rentals = @rentals_storage.rentals_from_array(@rentals_storage.read_data, @books, @people)
  end

  def list_books
    if @books.length.zero?
      puts 'You don\'t have any books'
    else
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def list_people
    if @people.length.zero?
      puts 'You need at least one person'
    else
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    education = gets.chomp.to_i
    case education
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'You can only choose between (1) or (2)'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp
    student = Student.new(age, nil, name, parent_permission: parent_permission)
    @people.push(student)
    puts 'Person created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @people.push(teacher)
    puts 'Person created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    list_books
    book_index = gets.chomp.to_i
    puts
    puts 'Select a person from the following list by number (not id)'
    list_people
    person_index = gets.chomp.to_i
    puts
    print 'Date: '
    date = gets.chomp
    @rentals.push(Rental.new(date, @people[person_index], @books[book_index]))
    puts 'Rental created successfully'
  end

  def person_rentals
    print 'ID of person:'
    person_id = gets.chomp.to_i
    @rentals.each do |rental|
      if rental.person.id == person_id
        puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end

  def exit_app
    @people_storage.write_data(@people_storage.objects_to_hash_array(@people))
    @books_storage.write_data(@books_storage.objects_to_hash_array(@books))
    @rentals_storage.write_data(@rentals_storage.objects_to_hash_array(@rentals))
    puts 'Thank you for using this app!'
    exit(true)
  end
end
