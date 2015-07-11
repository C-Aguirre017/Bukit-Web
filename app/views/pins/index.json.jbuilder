json.array!(@pins) do |pin|
  json.extract! pin, :id, :user_id, :publication, :realization, :duration, :title, :description, :price, :help_type, :faculty, :latitude, :longitude, :course_id
  json.url pin_url(pin, format: :json)
end
