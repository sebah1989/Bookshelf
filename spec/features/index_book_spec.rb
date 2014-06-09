require 'spec_helper'

describe "Index books page" do
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
    create(:book, title: 'Krzyzacy')
    create(:book, title: 'Potop')
    create(:book, title: 'Ogniem i mieczem')
    visit "/books"
    expect(page).to have_content 'Krzyzacy'
    expect(page).to have_content 'Potop'
    expect(page).to have_content 'Ogniem i mieczem'
  end
end