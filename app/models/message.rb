class Message
  include Mongoid::Document
  field :subject
  field :sender
  belongs_to :user
end
