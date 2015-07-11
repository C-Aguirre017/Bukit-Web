json.array!(@applications) do |application|
  json.extract! application, :id, :pin_id, :user_id, :reached
  json.url application_url(application, format: :json)
end
