require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(id, classroom, age = 18, name = 'Unknown', parent_permission: true)
    super(id, age, name, parent_permission)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
