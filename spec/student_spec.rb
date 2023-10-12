require_relative 'spec_helper'

describe Student do
  before :each do
    @student = Student.new(21, 'htet', nil, parent_permission: true)
  end

  describe '#new' do
    context 'when creating a new student instance' do
      it 'should return a student object' do
        expect(@student).to be_an_instance_of Student
      end

      it 'should return correct age' do
        expect(@student.age).to eql 21
      end

      it 'should return correct name' do
        expect(@student.name).to eql 'htet'
      end
    end
  end
end
