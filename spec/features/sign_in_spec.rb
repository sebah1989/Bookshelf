require 'spec_helper'

describe "The signin process", :type => :feature do
  before :each do
    create(:user)
  end

  it "signs me in when user exists in database" do
    visit '/login'
    within(".form-signin") do
      fill_in 'Email...', :with => 'user@example.com'
      fill_in 'Password...', :with => 'secret'
    end
    click_button 'submit'
    expect(page).to have_content 'user@example.com'
  end

  it "doesn't sign me in when user not found in database" do
    visit '/login'
    within(".form-signin") do
      fill_in 'Email...', :with => 'invalid@example.com'
      fill_in 'Password...', :with => 'secret'
    end
    click_button 'submit'
    expect(page).to have_content 'Please Sign in!'
  end
end