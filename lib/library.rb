# frozen_string_literal: true

require './config'

class Library
  include Save_Load
  attr_accessor :authors, :books, :readers, :orders

  def initialize(authors = [], books = [], readers = [], orders = [])
    @authors = authors
    @books = books
    @readers = readers
    @orders = orders
  end

  def top_readers(quantity = 1)
    top(:reader, quantity)
  end

  def most_popular_books(quantity = 1)
    top(:book, quantity)
  end

  def number_of_readers_of_the_most_popular_books(quantity = 3)
    books = most_popular_books(quantity)
    set = []
    @orders.each { |order| set << order.reader if (order.book && books).any? }
    set.uniq.length
  end

  # If i need to create a library by myself
  def <<(entity)
    case entity
    when Author then add_author(entity)
    when Book then add_book(entity)
    when Order then add_order(entity)
    when Reader then add_reader(entity)
    else raise TypeError, 'Incorrect type of data'
    end
  end

  private

  def add_author(author)
    @authors << author
  end

  def add_book(book)
    @books << book
  end

  def add_order(order)
    @orders << order
  end

  def add_reader(reader)
    @readers << reader
  end

  def top(object, quantity)
    @orders.group_by(&object).transform_values(&:count).sort_by { |_entity, times| -times }.first(quantity)
  end
end
