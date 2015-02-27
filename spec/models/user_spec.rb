require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a unique email' 
  it 'has a unique username'
  it 'has is invalid without a password'
end
