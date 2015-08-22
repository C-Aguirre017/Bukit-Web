json.array!(@applications) do |application|
  json.extract! application, :id, :pin_id, :user_id, :reached
end
