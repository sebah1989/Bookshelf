require 'spec_helper'

describe User do
  it { should have_secure_password }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:admin) }
  it { should be_valid }
  it { should have_one(:bookcase) }
  it { should have_many(:books).through(:bookcase) }

  subject(:user) { build(:user) }
  context 'is invalid because' do
    it 'email is not unique' do
      user.save
      user2 = build(:user, email: 'user@example.com')
      expect(user2).not_to be_valid 
    end
    it 'email is not present' do
      user.email = nil
      expect(user).not_to be_valid 
    end
  end
  context 'is valid' do
    it 'and is admin if there is no users in database' do
      user.save
      expect(user.admin).to be_truthy
    end
    it 'and is not admin if there is any user in database' do
      user.save
      user2 = create(:user, email: "user2@example.com")
      expect(user2.admin).to be_falsey
    end
  end

  context 'has his own bookshelf which'
    it 'is not nil' do
      user.save
      expect(user.bookcase).not_to be_nil
    end
    it 'has proper name' do
      user = build(:user, email: 'user@example.com')
      user.save
      expect(user.bookcase.name).to eq("user@example.com's bookshelf")
    end
end
