require 'rails_helper'

RSpec.describe "contracts/index", type: :view do
  let(:user) { create(:user, profile: :customer) }
  before(:each) do
    assign(:contracts, [
      Contract.create!(
        :customer => user,
        :description => "Description",
        :service_type => :sabotage
      ),
      Contract.create!(
        :customer => user,
        :description => "Description",
        :service_type => :sabotage
      )
    ])
  end

  it "renders a list of contracts" do
    render
    # assert_select "tr>td", :text => user.name, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 'sabotage', :count => 2
  end
end
