# frozen_string_literal: true

require './config'
def seed
  library = Library.new

  authors = []
  10.times do
    authors << Author.new(Faker::Book.unique.author,
                          Faker::Lorem.paragraph)
  end
  books = []
  40.times do
    books << Book.new(Faker::Book.unique.title,
                      authors.sample)
  end
  readers = []
  8.times do
    readers << Reader.new(Faker::Name.first_name,
                          Faker::Internet.unique.email,
                          Faker::Address.city,
                          Faker::Address.street_name,
                          rand(1..100))
  end
  orders = []
  9.times do
    orders << Order.new(books.sample,
                        readers.sample,
                        Date.today)
  end

  library.authors = authors
  library.books = books
  library.readers = readers
  library.orders = orders

  File.open('data.yaml', 'w') { |file| file.write library.to_yaml }
  library
end
