class Message
  include Mongoid::Document
  field :subject
  field :sender
  field :body
  field :senderid
  belongs_to :user
end
