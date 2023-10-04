class Classroom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
    @student = []
  end

  def add_student(student)
    student << student
    student. classroom = self
  end
end
