require "json"
require "open-uri"

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @transaction = Transaction.new
    @goal = Goal.new
    url = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=#{ENV['KEY_NEWS']}"
    news_serialized = URI.open(url).read
    @news = JSON.parse(news_serialized)
  end
end
