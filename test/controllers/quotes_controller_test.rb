require "test_helper"

class QuotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quote = quotes(:one)
  end

  test "should get index" do
    get quotes_url
    assert_response :success
  end

  test "should get new" do
    get new_quote_url
    assert_response :success
  end

  test "should create quote" do
    assert_difference("Quote.count") do
      post quotes_url, params: { quote: { ispublic: @quote.ispublic, philosopher_id: @quote.philosopher_id, quote_comment: @quote.quote_comment, quote_text: @quote.quote_text, quote_year: @quote.quote_year, user_id: @quote.user_id } }
    end

    assert_redirected_to quote_url(Quote.last)
  end

  test "should show quote" do
    get quote_url(@quote)
    assert_response :success
  end

  test "should get edit" do
    get edit_quote_url(@quote)
    assert_response :success
  end

  test "should update quote" do
    patch quote_url(@quote), params: { quote: { ispublic: @quote.ispublic, philosopher_id: @quote.philosopher_id, quote_comment: @quote.quote_comment, quote_text: @quote.quote_text, quote_year: @quote.quote_year, user_id: @quote.user_id } }
    assert_redirected_to quote_url(@quote)
  end

  test "should destroy quote" do
    assert_difference("Quote.count", -1) do
      delete quote_url(@quote)
    end

    assert_redirected_to quotes_url
  end
end
