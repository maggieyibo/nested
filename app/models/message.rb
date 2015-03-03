class Message
  include Mongoid::Document
  field :subject
  field :sender
  field :body
  belongs_to :user
end
