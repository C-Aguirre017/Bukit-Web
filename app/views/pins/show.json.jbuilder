json.extract! @pin, :id, :publication, :realization, :duration, :title, :description, :price, :help_type, :faculty, :latitude, :longitude, :created_at, :updated_at

  json.user do
    json.extract! @pin.user, :id, :email, :name, :role, :uid, :phone
  end

  json.course_id do
  	json.extract! @pin.course, :id, :name, :initials, :branch
  end
