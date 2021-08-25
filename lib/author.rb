# frozen_string_literal: true

require './modules/validation'
class Author
  include Validation
  attr_accessor :name, :biography

  def initialize(name, biography = '')
    @name = name
    @biography = biography
  end

  def validate
    validate_class(name, String)
    validate_empty(name)
  end
end
