require 'spec_helper'

describe "Index books page" do
  let(:user) { create(:user) }
  before(:each) do
    user
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

  context "when user" do
    it "is admin he can see add new book form" do
      user.update_attributes(admin: true)
      visit "/books"
      expect(page).to have_content "Create new book"
    end

    it "is not admin he can't see add new book form" do
      user.update_attributes(admin: false)
      visit "/books"
      expect(page).not_to have_content "Create new book"
    end
  end
end