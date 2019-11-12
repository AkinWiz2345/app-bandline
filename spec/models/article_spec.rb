require 'rails_helper'

RSpec.describe Article, type: :model do
  
  context "when user create a band_article" do
    before do
     @band_article = FactoryBot.build(:band_article)
    end
    it "has a valid factory of band_article" do
      expect(@band_article).to be_valid
    end
  end
  
  context "when user create a member_article" do
    before do 
      @member_article = FactoryBot.build(:member_article)
    end 
    it "has a valid factory of band_article" do
      expect(@member_article).to be_valid
    end
    it "equal gender of user" do
      expect(@member_article.gender).to eq @member_article.user.gender
    end
  end
  
end
