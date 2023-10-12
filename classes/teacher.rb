require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def specialization=(specialization)
    @specialization = specialization
    specialization.teachers.push(self) unless specialization.teachers.include?(self)
  end

  def can_use_services?
    true
  end
end
