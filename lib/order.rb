# frozen_string_literal: true

require './modules/validation'
class Order
  include Validation
  attr_accessor :book, :reader, :date

  def initialize(book, reader, date = Date.today)
    @book = book
    @reader = reader
    @date = date
    validate(book, reader, date)
  end

  def validate(book, reader, date)
    validate_class(book, Book)
    validate_class(reader, Reader)
    validate_class(date, Date)
  end
end
