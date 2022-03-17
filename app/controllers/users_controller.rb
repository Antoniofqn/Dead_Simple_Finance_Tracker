require "json"
require "open-uri"

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @transaction = Transaction.new
    url = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=fddea1745f2d4b02acf6d6cd50c22d26"
    news_serialized = URI.open(url).read
    @news = JSON.parse(news_serialized)
  end
end
