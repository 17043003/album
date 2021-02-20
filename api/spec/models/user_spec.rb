require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'name' do
    it 'is invalid, it is blank' do
      user = User.new( 
        name: ' ',
        email: 'aaaa@example.com',
        password: 'Example1234',
        password_confirmation: 'Example1234'
      )
      expect(user).to_not be_valid
    end

    it 'is invalid. it is too long' do
      user = User.new( 
        name: 'a'*101,
        email: 'aaaa@example.com',
        password: 'Example1234',
        password_confirmation: 'Example1234'
      )
      expect(user).to_not be_valid
    end
  end
end