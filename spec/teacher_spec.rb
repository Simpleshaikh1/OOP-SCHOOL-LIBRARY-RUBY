require_relative 'spec_helper'

describe Teacher do
  before :each do
    @teacher = Teacher.new('math', 40, 'John', parent_permission: true)
  end

  describe '#new' do
    context 'when creating a new teacher object ' do
      it 'should return a teacher object' do
        expect(@teacher).to be_an_instance_of Teacher
      end

      it 'should return correct age' do
        expect(@teacher.age).to eql(40)
      end

      it 'should return correct name' do
        expect(@teacher.name).to eql 'John'
      end

      it 'should return parent_permission' do
        expect(@teacher.parent_permission).to eql(true)
      end
    end
  end
end
