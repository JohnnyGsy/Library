# frozen_string_literal: true

require './modules/validation'
class Reader
  include Validation
  attr_accessor :name, :email, :city, :street, :house

  def initialize(name, email, address = {})
    @name = name
    @email = email
    @city = address[:city]
    @street = address[:street]
    @house = address[:house]
    validate(name, email, address)
  end

  def validate(name, email, address)
    [name, email, address[:city], address[:street]].each do |item|
      validate_class(item, String)
      validate_empty(item)
    end
    validate_class(address[:house], Integer)
    validate_positive(address[:house])
  end
end
