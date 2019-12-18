require 'rails_helper'

RSpec.describe "contracts/new", type: :view do
  let(:user) { create(:user, profile: :customer) }
  before(:each) do
    assign(:contract, Contract.new(
      :customer => user,
      :description => "Description",
      :service_type => :sabotage
    ))
  end 

  it "renders new contract form" do
    render

    assert_select "form[action=?][method=?]", contracts_path, "post" do
      assert_select "textarea[name=?]", "contract[description]"
      assert_select "select[name=?]", "contract[service_type]"
    end
  end
end
