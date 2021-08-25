# frozen_string_literal: true

require './modules/validation'
class Book
  include Validation
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    validate
  end

  def validate
    validate_class(author, Author)
    validate_empty(title)
    validate_class(title, String)
  end
end
