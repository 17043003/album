# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid' do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  describe 'name' do
    it 'is invalid, it is blank' do
      user = FactoryBot.build(:user, name: ' ')
      expect(user).to be_invalid
    end

    it 'is invalid, it is too long' do
      user = FactoryBot.build(:user, name: 'a' * 101)
      expect(user).to be_invalid
    end
  end

  describe 'email' do
    it 'is invalid, it is blank' do
      user = FactoryBot.build(:user, email: ' ')
      expect(user).to be_invalid
    end

    it 'is invalid, it is too long' do
      user = FactoryBot.build(:user, email: "#{'a' * 100}@example.com")
      expect(user).to be_invalid
    end

    it 'is invalid, they are not uniqueness' do
      FactoryBot.create(:user, email: 'testAddress@example.com')
      new_user = FactoryBot.build(:user, email: 'testAddress@example.com')
      expect(new_user).to be_invalid
    end
  end

  describe 'password' do
    it 'has less than 8 characters' do
      user = FactoryBot.build(:user, password: 'abcd')
      expect(user).to be_invalid
    end

    it 'has more than 20 characters' do
      user = FactoryBot.build(:user, password: 'a' * 21)
      expect(user).to be_invalid
    end

    it 'does not match password_confimation' do
      user = FactoryBot.build(:user, password: 'ExamplePassword', password_confirmation: 'TestPassword')
      expect(user).to be_invalid
    end
  end
end
