# frozen_string_literal: true

require './config'
module SaveLoad
  def save
    File.open(File.join('data.yaml'), 'w') { |file| file.write(to_yaml) }
  end

  def load
    load = YAML.load_file('data.yaml') if File.file?('data.yaml')
    @authors = load.authors
    @books = load.books
    @readers = load.readers
    @orders = load.orders
  end
end
