require 'spec_helper'

describe Book do
  it { should respond_to(:title) }
  it { should respond_to(:author) }
  it { should respond_to(:cover_photo) }
  it { should be_valid }
  it { should belong_to(:bookcase) }
end
