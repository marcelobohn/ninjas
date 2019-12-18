require 'rails_helper'

RSpec.describe Contract, type: :model do
  let(:user) { create(:user, :customer) }
  let(:ninja) { create(:user, :ninja) }
  context '#status' do
    before do
      subject = described_class.new(
        customer: user,
        service_type: :sabotage
        )
    end

    it 'new contract is open' do
      expect(subject.status).to eq :open
    end

    it 'with ninja is accepted' do
      subject.ninja = ninja
      expect(subject.status).to eq :accepted
    end

    it 'with ninja and date finish is finished' do
      subject.ninja = ninja
      subject.date_finished = Time.now
      expect(subject.status).to eq :finished
    end
  end
end
