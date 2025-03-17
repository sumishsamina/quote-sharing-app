json.extract! quote, :id, :quote_text, :quote_year, :quote_comment, :ispublic, :user_id, :created_at, :updated_at
#The philospher details 
if quote.philosopher
  json.philosopher do
    json.extract! quote.philosopher, :fname, :lname, :birth_year, :death_year, :biography
  end
end
json.url quote_url(quote, format: :json)
