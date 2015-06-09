json.array!(@parents) do |parent|
  json.extract! parent, :id, :name, :student, :email, :teacher_id
  json.url parent_url(parent, format: :json)
end
