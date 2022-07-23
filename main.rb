require_relative './app'

def menu
  puts
  puts 'Please choose an option by entering a number:'

  options = ['List all books', 'List all people', 'Create a person', 'Create a book', 'Create a rental',
             'List all rentals for a given person id', 'Exit']

  options.each_with_index do |option, index|
    puts "#{index + 1} - #{option}"
  end
end

def main(_loop) # rubocop:disable Metrics/MethodLength, Metrics/CyclomaticComplexity
  app = App.new
    puts 'Welcome to School Library App!'
  loop do
    menu
    option = gets.chomp.to_i

    case option
    when 1
      app.list_books
    when 2
      app.list_people
    when 3
      app.create_person
    when 4
      app.create_book
    when 5
      app.create_rental
    when 6
      app.person_rentals
    when 7
      puts 'Thank you for using this app!'
      break
    else
      puts 'Please choose an appropriate number'
    end
  end
end
main(true)