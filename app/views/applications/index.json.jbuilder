json.array!(@applications) do |application|
  json.extract! application, :id, :reached

  json.user do
    json.extract! application.user, :uid, :email, :name, :profession, :phone, :biography
  end
end
