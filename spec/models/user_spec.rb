require 'rails_helper'

RSpec.describe User, type: :model do
  it 'create' do
    user = create(:user)

    expect(user.email).to eq 'user@provider.com'
  end
end
