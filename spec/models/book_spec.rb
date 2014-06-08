require 'spec_helper'

describe Book do
  it { should respond_to(:title) }
  it { should respond_to(:author) }
  it { should respond_to(:cover_photo) }
  it { should have_and_belong_to_many(:bookcases) }
  it { should be_valid }
end
