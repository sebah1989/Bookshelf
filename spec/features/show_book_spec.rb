require 'spec_helper'

describe "Show book page" do
  it 'has proper content' do
    book = create(:book, title: 'Krzyzacy')
    visit "/books/#{book.id}"
    expect(page).to have_content 'Krzyzacy'
  end
end