require 'spec_helper'

describe User do
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:admin) }

  it { should be_valid }
end
