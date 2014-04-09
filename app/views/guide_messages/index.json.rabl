collection @guide_messages, root: :guide_messages

attributes :id, :rookie_id
attributes :id, :guide_id
attributes :id, :message

node :href do |guide_message|
  guide_message_url(guide_message)
end