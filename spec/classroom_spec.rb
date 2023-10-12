require_relative 'spec_helper'

describe Classroom do
  before :each do
    @classroom = Classroom.new('Math')
  end

  describe '#new' do
    it 'classroom should be an instance of Classroom' do
      expect(@classroom).to be_an_instance_of Classroom
    end
  end

  describe '#label' do
    it 'label should be equal to Math' do
      expect(@classroom.label).to eql 'Math'
    end
  end

  describe '#students' do
    it 'students should be equal array' do
      expect(@classroom.students).to eql []
    end
  end
end
