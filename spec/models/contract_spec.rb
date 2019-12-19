require 'rails_helper'

RSpec.describe Contract, type: :model do
  let(:user) { create(:user, :customer) }
  let(:ninja) { create(:user, :ninja) }
  let(:ninja_other) { create(:user, :ninja, email: 'olher@example.com') }
  context '#status' do
    before do
      subject = described_class.new(
        customer: user,
        service_type: :sabotage
        )
    end

    it 'new contract is open' do
      expect(subject.status).to eq :open
      expect(subject.open?).to be_truthy
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

  context '#ninja_accept' do
    let(:contract) {
      described_class.create!( 
        customer: user, service_type: :sabotage
      )
    }

    it 'change status when ninja available' do
      expect(contract.open?).to be_truthy

      contract.ninja_accept(ninja)
      expect(contract.open?).to be_falsey
    end

    it 'dont change status when ninja is not available' do
      described_class.create!(
        customer: user,
        ninja: ninja,
        service_type: :sabotage
      )

      contract.ninja_accept(ninja)
      expect(contract.open?).to be_truthy
    end
  end

  context '#ninja_finish' do
    let(:contract) {
      described_class.create!(
        customer: user, ninja: ninja, date_accepted: Time.now, service_type: :sabotage
      )
    }

    it 'change status when ninja its tha same to accept' do
      contract.ninja_finish(ninja)
      expect(contract.finished?).to be_truthy
    end

    it 'dont change status when ninja its other' do
      contract.ninja_finish(ninja_other)
      expect(contract.finished?).to be_falsey
    end
  end

  context '#customer_rating' do
    let(:contract) {
      described_class.create!(
        customer: user, ninja: ninja, service_type: :sabotage, date_finished: Time.now
      )
    }

    it 'change status when ninja its tha same to accept' do
      contract.customer_rating(user, 8)

      expect(contract.rating).to eq(8)
    end
  end
end
