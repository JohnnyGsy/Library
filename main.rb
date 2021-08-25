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

lib_methods(library)

library.save
