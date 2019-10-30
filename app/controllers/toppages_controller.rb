class ToppagesController < ApplicationController
  def index
    @articles = Article.limit(5).order(id: :desc)
  end
end
