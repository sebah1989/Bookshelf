require 'spec_helper'

describe "New book page" do

  it "has proper content" do
    visit '/books/new'
    expect(page).to have_content 'Create new book'
  end

  it "has form which can be filled with values and submitted" do
    visit '/books/new'
    fill_in('title', with: 'Latarnik')
    fill_in('author', with: 'Henryk Sienkiewicz')
    fill_in('cover_photo', with: 'http://hatteria.pl/images/sienkiewicz_latarnik.jpg')
    click_button('Submit')
    expect(page).to have_content "Created Latarnik book!"
  end
  
end