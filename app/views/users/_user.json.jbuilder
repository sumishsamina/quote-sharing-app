json.extract! user, :id, :fname, :string, :lname, :string, :email, :string, :uniq, :password_digest, :string, :is_admin, :boolean, :status, :string, :created_at, :updated_at
json.url user_url(user, format: :json)
