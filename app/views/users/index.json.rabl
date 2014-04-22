collection @users, root: :users

attributes :id, :email
attributes :id, :first_name
attributes :id, :last_name
attributes :id, :avatar

node :href do |user|
  user_url(user)
end