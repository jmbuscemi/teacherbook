json.array!(@teachers) do |teacher|
  json.extract! teacher, :id, :name, :email, :password
  json.url teacher_url(teacher, format: :json)
end
