require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do 
    expect(FactoryGirl.create(:user)).to be_valid
  end
  it 'has a unique email' 
  it 'has a unique username'
  it 'has is invalid without a password'
end
