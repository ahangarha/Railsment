require 'rails_helper'

RSpec.describe Group, type: :model do
  before :each do
    User.create!(name: 'Mostafa', email: 'mostafa@rails.com', password: '123456')
  end

  let(:the_group) { Group.new(user: User.first, name: 'Bills') }

  context 'validation' do
    it 'passes initially' do
      expect(the_group).to be_valid
    end

    it 'fails with no name' do
      the_group.name = nil
      expect(the_group).to_not be_valid
    end
  end
end
