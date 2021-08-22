# frozen_string_literal: true

require './modules/validation'
class Book
  include Validation
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    validate(title, author)
  end

  def validate(title, author)
    validate_class(author, Author)
    validate_empty(title)
    validate_class(title, String)
  end
end
