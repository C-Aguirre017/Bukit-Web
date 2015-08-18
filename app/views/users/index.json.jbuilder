json.array!(@users) do |user|
  json.extract! user, :id, :name, :profession, :email, :phone
end
