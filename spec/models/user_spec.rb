require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a name, email, password_digest, gender, birtday, and introduction" do
    user = User.new(
     name: 'Tester',
     email: 'tester@example.com',
     password_digest: 'dottle-nouveau-pavilion-tights-furze',
     gender: '男性',
     birthday: '2000-10-10',
     introduction: 'hello'
    )
    expect(user).to be_valid
  end
  # 名前がなければ無効な状態であること
  it "is invalid without a name" do 
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end
  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicate email address" do
    User.create(
     name: 'Tester',
     email: 'tester@example.com',
     password_digest: 'dottle-nouveau-pavilion-tights-furze',
     gender: '男性',
     birthday: '2000-10-10',
     introduction: 'hello'
    )
    
    user = User.new(
     name: 'Tester2',
     email: 'tester@example.com',
     password_digest: 'dottle-nouveau-pavilion-tights-furze',
     gender: '男性',
     birthday: '2000-10-10',
     introduction: 'hello'
    )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
  
  it "returns user's age as integer" do
    user = User.new(
     name: 'Tester',
     email: 'tester@example.com',
     password_digest: 'dottle-nouveau-pavilion-tights-furze',
     gender: '男性',
     birthday: '1993-11-20',
     introduction: 'hello'
    )
    expect(user.age).to eq 25
  end
  
end
