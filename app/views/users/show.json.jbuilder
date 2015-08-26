json.extract! @user, :id, :name, :profession, :email, :phone, :biography, :created_at, :updated_at

json.university do
	json.extract! @user.university, :id, :name
end