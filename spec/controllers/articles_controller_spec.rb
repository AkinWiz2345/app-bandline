require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe '#index' do
    context 'when there are articles' do
      before do
        @articles = FactoryBot.create_list(:band_article, 10)
      end
      # 正常にレスポンスを返すこと
      it "responds successfully" do
        get :index
        expect(response).to be_success 
      end
      # レスポンス200を返すこと
      it "responds successfully" do
        get :index
        expect(response).to have_http_status "200"
      end
    end
  end
   
  describe '#show' 
end
