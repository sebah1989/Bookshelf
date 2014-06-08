require 'spec_helper'

describe Bookcase do
  it { should respond_to(:name) }
  it { should have_and_belong_to_many(:books) }
  it { should belong_to(:user) }
end
