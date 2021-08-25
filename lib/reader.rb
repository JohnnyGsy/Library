# frozen_string_literal: true

require './modules/validation'
class Reader
  include Validation
  attr_reader :name, :email, :city, :street, :house

  def initialize(name, email, address = {})
    @name = name
    @email = email
    @city = address[:city]
    @street = address[:street]
    @house = address[:house]
    validate
  end

  def validate
    [name, email, city, street].each do |item|
      validate_class(item, String)
      validate_empty(item)
    end
    validate_class(house, Integer)
    validate_positive(house)
  end
end
