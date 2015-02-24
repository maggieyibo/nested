class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  field :username, type: String
  field :email, type: String
  field :password_digest, type: String
  has_many :listings

  has_secure_password

  validates :email, uniqueness: true
  validates :username, uniqueness: true
  validates :password, confirmation: true

end
