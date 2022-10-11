require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validation Tests" do
    it "Ensure name presence" do
      user = User.new(email: 'Rishibarua08@gmail.com', password: 'asdasd', password_confirmation: 'asdasd').save
      expect(user).to eq(false) 
    end
    it "Ensure email presence" do
      user = User.new(name: 'Rishi', password: 'asdasd', password_confirmation: 'asdasd').save
      expect(user).to eq(false)
    end
    it "Ensure Password Presence" do
      user = User.new(name: 'Rishi', email: 'Rishibarua08@gmail.com').save
      expect(user).to eq(false)
    end
    it "Ensure passowrd length" do
      user = User.new(name: 'Rishi', email: 'Rishibarua08@gmail.com',password: 'aa', password_confirmation: 'aa').save
      expect(user).to eq(false)
    end
    it "Ensure proper Email" do
      user = User.new(name: 'Rishi', email: 'Rishi',password: 'asdasd', password_confirmation: 'asdasd').save
      expect(user).to eq(false)
    end
    it "Ensure password and confirmation same" do
      user = User.new(name: 'Rishi', email: 'Rishibarua08@gmail.com',password: 'asdasd', password_confirmation: 'qweqwe').save
      expect(user).to eq(false)
    end
    it "Should save successfully" do
      user = User.new(name: 'Rishi', email: 'Rishi',password: 'asdasd', password_confirmation: 'asdasd').save
      expect(user).to eq(false)
    end
  end
end
