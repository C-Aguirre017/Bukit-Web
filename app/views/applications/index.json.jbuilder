json.array!(@applications) do |application|
  json.extract! application, :id, :pin_id, :reached

  json.user do
    json.extract! application.user, :id, :email, :name, :profession, :phone, :biography
  end
end
