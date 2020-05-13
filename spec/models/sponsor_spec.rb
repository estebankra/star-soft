require 'rails_helper'

RSpec.describe Supply, :type => :model do

  describe 'sponsor contain an name' do
    let(:sponsor) { build(:sponsor, name: 'Test') }

    subject { sponsor.name }

    it 'has an name' do
      expect(subject).to eq('Test')
    end
  end

  describe 'validate an sponsor' do
    let(:sponsor) { build(:sponsor) }

    subject { sponsor }

    it 'validate sponsor' do
      expect(subject).to_not be_valid
    end
  end
end