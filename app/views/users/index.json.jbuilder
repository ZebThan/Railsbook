json.array!(@users) do |user|
  json.extract! user, :id, :name, :about, :age, :sex, :progress
  json.url user_url(user, format: :json)
end
