require 'spec_helper'

describe "Show book page" do
  before(:each) do
    create(:user)
    visit '/login'
    within(".form-signin") do
      fill_in 'Email...', :with => 'user@example.com'
      fill_in 'Password...', :with => 'secret'
    end
    click_button 'submit'
  end
  
  it 'has proper content' do
    book = create(:book, title: 'Krzyzacy')
    visit "/books/#{book.id}"
    expect(page).to have_content 'Krzyzacy'
  end
end