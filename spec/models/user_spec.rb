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






  end
end
