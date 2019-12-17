require "rails_helper"

RSpec.describe "Home page", type: :system do
  it 'have initial text' do
    visit "/home/index"
    expect(page).to have_text("Home#index")
  end
end