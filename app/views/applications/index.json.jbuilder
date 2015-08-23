json.array!(@applications) do |application|
  json.extract! application, :reached

  json.user do
    json.extract! application.user, :email, :name, :profession, :phone, :biography
  end
end
