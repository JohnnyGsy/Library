# frozen_string_literal: true

require './modules/validation'
class Reader
  include Validation
  attr_accessor :name, :email, :city, :street, :house

  def initialize(name, email, city, street, house)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
    validate(name, email, city, street, house)
  end

  def validate(name, email, city, street, house)
    [name, email, city, street].each do |item|
      validate_class(item, String)
      validate_empty(item)
    end
    validate_class(house, Integer)
    validate_positive(house)
  end
end
