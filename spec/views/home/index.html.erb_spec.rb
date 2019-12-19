require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :view do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "displays default text" do
    render

    expect(rendered).to match('Welcome to the ninja missions control system')
  end
end
