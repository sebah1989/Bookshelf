require 'spec_helper'

describe "New book page" do

  it "has proper content" do
    visit '/books/new'
    expect(page).to have_content 'Create new book'
  end

  it "has form which can be filled with values and submitted" do
    visit '/books/new'
    fill_in('Title', with: 'Latarnik')
    fill_in('Author', with: 'Henryk Sienkiewicz')
    click_button('Create Book')
    expect(page).to have_content "Title: Latarnik"
  end
  
end