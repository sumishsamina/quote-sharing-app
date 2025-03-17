class SearchController < ApplicationController

  def index
    category_query = params[:category_query]#Gets the search query
		if category_query.present?#Checks if the search query is present
		  @quotematch = Quote.joins(:quote_categories, :categories).where("category.catname LIKE ?", "%#{category_query}%").distinct#Looks for categories that match the the category name based on the query
    end

  end
end
