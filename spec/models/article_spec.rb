require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    @user = User.create(
     name: 'Tester',
     email: 'tester@example.com',
     password_digest: 'dottle-nouveau-pavilion-tights-furze',
     gender: '男性',
     birthday: '2000-10-10',
     introduction: 'hello'
    )
  end
  
  # バンドメンバー募集サイトを作成するとき
  context "when user create a band_article" do
    it "is valid with a kind, heading, introduction, and gender" do
      article = @user.articles.new(
        kind: 'band',
        heading: 'Hello',
        introduction: 'nice to meet you',
        gender: '指定なし'
      )
      expect(article).to be_valid
    end
  end
  # メンバー加入希望サイトを作成するとき
  context "when user create a member_article"
    it "is invalid without an introduction" do
      article = @user.articles.new(
        kind: 'member',
        heading: 'Hello',
        introduction: nil,
        gender: '指定なし'
      )
      expect(article).to_not be_valid
    end
  
end
