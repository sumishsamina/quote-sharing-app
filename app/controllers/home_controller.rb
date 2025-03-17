class HomeController < ApplicationController
  def index
    #Retrive the latest 5 quoutes with their corresponding user and philosopher records
    @quotes = Quote.includes(:user, :philosopher).order(created_at: :desc).limit(5)
  end
  #Retrieve quotes associated with the user that is currently logged in with the dtails of the categories.
  def uquotes
    @quotes = Quote.includes(:categories).where(user_id: session[:user_id])
  end
end