# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do

  it { should validate_uniqueness_of(:username)}
  subject(:miguel) {User.create(
    username: "Miguel",
    email: "miguel@gmail.com",
    password: "miguel"
  )}
  
  describe "uniqueness" do
    before :each do
      build(:user)
    end

    it { should validate_presence_of(:username)}
    it {should validate_uniqueness_of(:username)}
    it { should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    # it { should validate_presence_of(:password)}
    # it { should validate_presence_of(:session_token)}
  end

  describe "::find_by_credentials" do
    user = User.first
    it "expects to find a user given correct attributes" do
      expect(User.find_by_credentials("Miguel",'miguel')).to eq(user)
    end

    it "expects to return nil when given wrong attributes" do
      expect(User.find_by_credentials("Miguel", "banana")).to eq(nil)
    end
  end
  
  describe "#is_password?" do
    it "returns true when passed a correct password" do
      expect(miguel.is_password?("miguel")).to be true
    end

    it "returns true when passed an incorrect password" do
      expect(miguel.is_password?("banana")).to be false
    end
  end

  describe "#reset_session_token!" do
    it "sets a new session token for the user" do
      miguel.valid?
      prev_token = miguel.session_token
      miguel.reset_session_token!

      expect(miguel.session_token).to_not eq(prev_token)
    end
  end



end
