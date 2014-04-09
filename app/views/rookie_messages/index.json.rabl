collection @rookie_messages, root: :rookie_messages

attributes :id, :rookie_id
attributes :id, :guide_id
attributes :id, :message

node :href do |rookie_message|
  rookie_message_url(rookie_message)
end