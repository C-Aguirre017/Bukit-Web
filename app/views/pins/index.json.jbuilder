json.array!(@pins) do |pin|
  json.extract! pin, :id, :publication, :realization, :duration, :title, :description, :price, :help_type, :faculty, :latitude, :longitude
  
  json.user do
    json.extract! pin.user, :id, :email, :name, :role, :uid, :phone
  end

  json.course_id do
  	json.extract! pin.course, :id, :name, :initials, :branch
  end


  json.url pin_url(pin, format: :json)
end
