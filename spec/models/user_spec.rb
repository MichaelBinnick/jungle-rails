require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'user validation' do
    it "saves when all fields entered" do
      @user = User.new(
        first_name: "Michael",
        last_name: "Binnick",
        email: "mike@abc.com",
        password: "password123",
        password_confirmation: "password123"
      )
      @user.save
      expect(@user).to be_valid
    end

    it "can't have mismatched password and password_confirmation fields" do
      @user = User.new(
        first_name: "Michael",
        last_name: "Binnick",
        email: "mike@abc.com",
        password: "password123",
        password_confirmation: "password12spock"
      )
      @user.validate
      expect(@user).to be_invalid
    end

    it "should fail to validate because email already used" do 
      @user = User.new(
        first_name: "Michael",
        last_name: "Binnick",
        email: "mike@abc.com",
        password: "password123",
        password_confirmation: "password123"
      )
      @user.save
      @user_dupe = User.new(
        first_name: "Bichael",
        last_name: "Minnick",
        email: "MIKE@ABC.COM",
        password: "eviltwin92",
        password_confirmation: "eviltwin92"
      )
      @user_dupe.validate 
      expect(@user_dupe.errors.full_messages).to include("Email has already been taken")
    end 

    describe "must have valid first_name, last_name, email, password and password_confirmation fields" do
      it "should be invalid when first_name is blank" do
        @user = User.new(
          first_name: nil,
          last_name: "Binnick",
          email: "mike@abc.com",
          password: "password123",
          password_confirmation: "password123"
        )
        @user.validate
        expect(@user).to be_invalid
      end
    
      it "should be invalid when last_name is blank" do
        @user = User.new(
          first_name: "Michael",
          last_name: nil,
          email: "mike@abc.com",
          password: "password123",
          password_confirmation: "password123"
        )
        @user.validate
        expect(@user).to be_invalid
      end
    
      it "should be invalid when email is blank" do
        @user = User.new(
          first_name: "Michael",
          last_name: "Binnick",
          password: "password123",
          password_confirmation: "password123"
        )
        @user.validate
        expect(@user).to be_invalid
      end
    
      it "should be invalid when password is blank" do
        @user = User.new(
          first_name: "Michael",
          last_name: "Binnick",
          email: "mike@abc.com",
          password: nil,
          password_confirmation: "password123"
        )
        @user.validate
        expect(@user).to be_invalid
      end
    
      it "should be invalid when password_confirmation is blank" do
        @user = User.new(
          first_name: "Michael",
          last_name: "Binnick",
          email: "mike@abc.com",
          password: "password123",
          password_confirmation: nil
        )
        @user.validate
        expect(@user).to be_invalid
      end
    
    end

    it "should fail to validate if password is under min length(8)" do
      @user = User.new(
        first_name: "Michael",
        last_name: "Binnick",
        email: "mike@abc.com",
        password: "pass123",
        password_confirmation: "pass123"
      )
      @user.validate
      expect(@user).to be_invalid
    end
  end

end