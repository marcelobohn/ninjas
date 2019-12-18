require 'rails_helper'

RSpec.describe "contracts/show", type: :view do
  let(:user) { create(:user, profile: :customer) }
  before(:each) do
    @contract = assign(:contract, Contract.create!(
      :customer => user,
      :description => "Description",
      :service_type => :sabotage
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/sabotage/)
  end
end
