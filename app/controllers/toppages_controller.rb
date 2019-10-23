class ToppagesController < ApplicationController
  def index
    @articles = Article.limit(3).order(id: :desc)
  end
end
