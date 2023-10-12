require_relative 'spec_helper'

describe Person do
  before :each do
    @person = Person.new(21, 'htetwaiyan')
  end

  describe '#new' do
    it 'person should be an instance of Person' do
      expect(@person).to be_an_instance_of Person
    end
  end

  describe '#age' do
    it 'age should be equal to 21' do
      expect(@person.age).to eql 21
    end
  end

  describe '#name' do
    it 'name should be equal to htetwaiyan' do
      expect(@person.name).to eql 'htetwaiyan'
    end
  end

  describe '#parent_permission' do
    it 'parent_permission should be equal to true' do
      expect(@person.instance_variable_get(:@parent_permission)).to be_truthy
    end
  end
end
