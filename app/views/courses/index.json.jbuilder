json.array!(@courses) do |course|
  json.extract! course, :id, :name, :initials, :branch
  json.url course_url(course, format: :json)
end
