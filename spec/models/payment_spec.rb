require 'rails_helper'

RSpec.describe Payment, type: :model do
  before :each do
    User.create!(name: 'Mostafa', email: 'mostafa@rails.com', password: '123456')
  end

  let(:the_payment) { Payment.new(author: User.first, name: 'Gas Bill', amount: 10) }

  context 'validation' do
    it 'passes initially' do
      expect(the_payment).to be_valid
    end

    it 'fails with no name' do
      the_payment.name = nil
      expect(the_payment).to_not be_valid
    end

    it 'fails with no amount' do
      the_payment.amount = nil
      expect(the_payment).to_not be_valid
    end

    it 'fails with string amount' do
      the_payment.amount = 'a'
      expect(the_payment).to_not be_valid
    end

    it 'fails with negative amount' do
      the_payment.amount = -1
      expect(the_payment).to_not be_valid
    end
  end
end
