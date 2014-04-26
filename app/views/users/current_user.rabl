object @current_user

attributes :email
attributes :first_name
attributes :last_name
attributes :avatar

node :guide_id do |current_user|
  current_user.guide.id
end

node :rookie_id do |current_user|
  current_user.rookie.id
end

node :guide_pins do |current_user|
  current_user.guide.pins
end