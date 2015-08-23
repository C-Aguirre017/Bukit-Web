json.array!(@pins) do |pin|
  json.extract! pin, :id, :user_id, :publication, :realization, :duration, :title, :description, :price, :help_type, :faculty, :latitude, :longitude 

  json.applications pin.cantSolicitudes.as_json

  json.user do
    json.extract! pin.user, :id, :email, :name, :profession, :phone
  end

  json.course do
  	json.extract! pin.course, :id, :name, :initials, :branch
  end
end
