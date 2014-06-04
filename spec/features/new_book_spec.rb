require 'spec_helper'

describe "Creating new book process" do

  it "new book page" do
    visit '/books/new'
    expect(page).to have_content 'Create new book'
  end
  
end