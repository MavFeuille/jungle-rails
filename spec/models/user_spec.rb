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

    it "is not valid if password length is shorter than 8 characters" do
      @user = User.create(
        first_name: 'test first name',
        last_name: 'test last name',
        email: '1@1.com',
        password: '12345678',
        password_confirmation: '1234567'
      )
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it "is valid if users credentials are valid" do
      @user = User.create(
        first_name: 'first name',
        last_name: 'last name',
        email: '1@1.com',
        password: '12345678',
        password_confirmation: '12345678'
      )
      @user.save

      user = User.authenticate_with_credentials('1@1.com', '12345678')
      expect(user).to eql(@user)
    end

    it "should not pass if users credentials are valid" do
      @user = User.create(
        first_name: 'first name',
        last_name: 'last name',
        email: '1@1.com',
        password: '12345678',
        password_confirmation: '12345678'
      )
      @user.save

      user = User.authenticate_with_credentials('1@1.com', '123456789')
      expect(user).to be(nil)
    end

    it "should pass when email contains spaces" do
      @user = User.create(
        first_name: 'first name',
        last_name: 'last name',
        email: '1@1.com',
        password: '12345678',
        password_confirmation: '12345678'
      )
      @user.save

      user = User.authenticate_with_credentials(' 1@1.com ', '12345678')
      expect(user).to eql(@user)
    end
  end


end

