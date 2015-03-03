class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :email, type: String
  field :password_digest, type: String
  field :firstname
  field :lastname
  field :phonenumber
  field :occupation
  field :bio
  field :age
  field :personality
  has_many :listings
  has_many :messages

  has_secure_password

  validates :email, uniqueness: true
  validates :password, confirmation: true

end
