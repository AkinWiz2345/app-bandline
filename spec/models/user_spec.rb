require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @valid_user = FactoryBot.build(:user)
  end
  
  it "has a valid factory" do
    expect(@valid_user).to be_valid
  end
  
  # 名がなければ無効な状態であること
  it "is invalid without a first name" do
    @valid_user.name = nil
    @valid_user.valid?
    expect(@valid_user.errors[:name]).to include("can't be blank")
  end
  
  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicate email address" do
    FactoryBot.create(:user, email: "tester@example.com")
    user = FactoryBot.build(:user, email: "tester@example.com")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
  
  it "returns user's age as integer" do
    expect(@valid_user.age).to eq 19
  end
  
end
