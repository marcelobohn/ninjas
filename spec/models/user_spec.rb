require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'create' do
    it 'profile is customer' do
      user = create(:user, :customer)

      expect(user.email).to eq 'customer@provider.com'
      expect(user.profile).to eq 'customer'
      expect(user.name).to eq 'customer sample'
      expect(user.customer?).to be_truthy
      expect(user.ninja?).to be_falsey
    end

    it 'profile is ninja' do
      user = create(:user, :ninja)

      expect(user.email).to eq 'ninja@provider.com'
      expect(user.profile).to eq 'ninja'
      expect(user.name).to eq 'ninja sample'
      expect(user.customer?).to be_falsey
      expect(user.ninja?).to be_truthy
    end
  end
end
