require 'spec_helper'

describe "Show bookcase page" do
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

  it "has proper header" do
    visit "/bookcases/#{user.bookcase.id}"
    expect(page).to have_content "#{user.email}'s bookshelf"
  end

  it "has books which user added to his bookshelf" do
    book = create(:book, title: "Testowa")
    user.bookcase.books << book
    user.bookcase.save
    visit "/bookcases/#{user.bookcase.id}"
    expect(page).to have_content "Testowa"
  end

  context "when user" do
    it "is admin he can see add new book form" do
      user.update_attributes(admin: true)
      visit "/bookcases/#{user.bookcase.id}"
      expect(page).to have_content "Add new book to bookshelf"
    end

    it "is not admin he can't see add new book form" do
      user.update_attributes(admin: false)
      visit "/bookcases/#{user.bookcase.id}"
      expect(page).not_to have_content "Add new book to bookshelf"
    end
  end
end