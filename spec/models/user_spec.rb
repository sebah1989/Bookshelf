require 'spec_helper'

describe User do
  subject(:user) { build(:user) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:admin) }
  it { should be_valid }
  context 'is invalid because email is' do
    it 'not unique' do
      user.save
      user2 = build(:user, email: 'user@example.com')
      expect(user2).not_to be_valid 
    end
    it 'not present' do
      user.email = nil
      expect(user).not_to be_valid 
    end
  end
end
