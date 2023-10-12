require_relative 'spec_helper'

describe Rental do
  before :each do
    @person = Person.new(21, 'htet')
    @book = Book.new('hello world', 'yan')
  end

  describe '#new' do
    it 'should create rental instance with both person and book' do
      rental = Rental.new('2022/12/2', @person, @book)
      expect(rental.date).to eq('2022/12/2')
      expect(rental.book).to be(@book)
      expect(rental.person).to be(@person)
    end
  end
end
