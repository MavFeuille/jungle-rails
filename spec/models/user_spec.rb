require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "is not valid if password and password_confirmation does not match" do
      @user = User.create(
        first_name: 'test first name',
        last_name: 'test last name',
        email: '1@1.com',
        password: 'testpw',
        password_confirmation: 'teStpw'
      )
      expect(@user).to_not be_valid
    end

    it "email must be unique - exact same email" do
      user1 = User.create(
        first_name: 'user1 first',
        last_name: 'user1 last',
        email: 'user1@user1.com',
        password: '123',
        password_confirmation: '123'
      )
      user2 = User.create(
        first_name: 'user2 first',
        last_name: 'user2 last',
        email: 'user1@user1.com',
        password: '123',
        password_confirmation: '123'
      )
      expect(user2).to_not be_valid
    end

    it "email must be unique - not case sensitive" do
      user1 = User.create(
        first_name: 'user1 first',
        last_name: 'user1 last',
        email: 'user1@user1.com',
        password: '123',
        password_confirmation: '123'
      )
      user2 = User.create(
        first_name: 'user2 first',
        last_name: 'user2 last',
        email: 'user1@user1.COM',
        password: '123',
        password_confirmation: '123'
      )
      expect(user2).to_not be_valid
    end

    it "is not valid if email is nil" do
      @user = User.create(
        first_name: 'test first name',
        last_name: 'test last name',
        # email: nil,
        password: 'testpw',
        password_confirmation: 'teStpw'
      )
      expect(@user).to_not be_valid
    end
    
    it "is not valid if first name is nil" do
      @user = User.create(
        first_name: nil,
        last_name: 'test last name',
        email: '1@1.com',
        password: 'testpw',
        password_confirmation: 'teStpw'
      )
      expect(@user).to_not be_valid
    end

    it "is not valid if last name is nil" do
      @user = User.create(
        first_name: 'test first name',
        last_name: nil,
        email: '1@1.com',
        password: 'testpw',
        password_confirmation: 'teStpw'
      )
      expect(@user).to_not be_valid
    end

  end
end
