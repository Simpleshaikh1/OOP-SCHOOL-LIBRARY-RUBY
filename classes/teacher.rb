require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(id, age = 18, name = "Unknown", parent_permission = true, specialization)
    super(id, age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
