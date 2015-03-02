require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do 
    expect(FactoryGirl.build(:user, email: 'hi@gmail.com')).to be_valid
  end
  it 'has a unique email' do 
    girl = FactoryGirl.build(:user, email: 'josephgogo@gmail.com')
    expect(girl.save).to be_invalid
  end
end
