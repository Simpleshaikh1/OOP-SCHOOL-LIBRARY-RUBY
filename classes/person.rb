require_relative 'nameable'
require_relative 'rental'

class Person < Nameable
  attr_accessor :name, :age, :rental, :parent_permission
  attr_reader :id

  def initialize(id, age = 18, name = 'Unknown', parent_permission: true)
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end

  def add_rental(date, book)
    Rental.new(date, self, book)
  end
end
