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

    it "email must be unique" do
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






  end
end
