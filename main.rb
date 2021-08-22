# frozen_string_literal: true

require './config'

def lib_methods(library)
  library_top_readers = library.top_readers
  puts 'Top readers: '
  library_top_readers.each do |reader, count|
    puts "Reader #{reader.name} has ordered #{count} books"
  end
  library_topbooks = library.most_popular_books
  puts 'Most popular books: '
  library_topbooks.each do |book, _author|
    puts "Book: #{book.title}, Author: #{book.author.name} "
  end

  puts "Number of readers of the most popular book:
  #{library.number_of_readers_of_the_most_popular_books(2)}"
end

library = Library.new

File.file?('data.yaml') ? library.load : library = seed 

#  #Creating the library by myself
#
# author1 = Author.new('author1', 'biography1')
# author2 = Author.new('author2', 'biography2')
# author3 = Author.new('author3', 'biography3')
#
# book1 = Book.new('title1', author1)
# book2 = Book.new('title2', author2)
# book3 = Book.new('title3', author3)
#
#
# reader1 = Reader.new('name', 'email', 'city', 'street', 1)
# reader2 = Reader.new('name2', 'email2', 'city2', 'street2', 2)
# reader3 = Reader.new('name3', 'email3', 'city3', 'street3', 3)
#
#
# order1 = Order.new(book1, reader1, Date.today)
# order2 = Order.new(book2, reader1, Date.today)
# order3 = Order.new(book3, reader3, Date.today)
# order4 = Order.new(book2, reader2, Date.today)
# order5 = Order.new(book1, reader3, Date.today)
#
#
# library << author1
# library << author2
# library << author3
#
#
# library << book1
# library << book2
# library << book3
#
#
# library << reader1
# library << reader2
# library << reader3
#
#
# library << order1
# library << order2
# library << order3
# library << order4
# library << order5

lib_methods(library)

library.save
