# frozen_string_literal: true

module Validation
  def validate_empty(value)
    raise ArgumentError, 'Value cannot be blank' if value.empty?
  end

  def validate_class(value, value_class)
    raise TypeError, 'Incorrect type of data' unless value.is_a?(value_class)
  end

  def validate_positive(value)
    raise ArgumentError, 'Value cannot be negative' if value.negative?
  end
end
