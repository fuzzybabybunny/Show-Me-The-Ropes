collection @users, root: :users

attributes :id, :email
attributes :id, :first_name
attributes :id, :last_name

node :href do |user|
  user_url(user)
end