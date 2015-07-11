json.array!(@users) do |user|
  json.extract! user, :id, :name, :profession, :email, :role, :phone
  json.url user_url(user, format: :json)
end
