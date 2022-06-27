require 'rails_helper'

RSpec.describe User, type: :model do
  let(:the_user) { User.new(name: 'Mostafa', email: 'msotafa@rails.com', password: '123456') }

  context 'validation' do
    it 'passes initially' do
      expect(the_user).to be_valid
    end

    it 'fails with no name' do
      the_user.name = nil
      expect(the_user).to_not be_valid
    end

    it 'fails with no email' do
      the_user.email = nil
      expect(the_user).to_not be_valid
    end

    it 'fails with no password' do
      the_user.email = nil
      expect(the_user).to_not be_valid
    end
  end
end
