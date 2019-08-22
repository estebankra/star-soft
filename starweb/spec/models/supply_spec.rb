require 'rails_helper'

RSpec.describe Supply, :type => :model do

  describe 'supply contain an name' do
    let(:supply) { build(:supply, name: 'Remera Lisa') }

    subject { supply.name }

    it 'has an name' do
      expect(subject).to eq('Remera Lisa')
    end
  end

  describe 'supply contain an description' do
    let(:supply) { build(:supply, description: 'Test') }

    subject { supply.description }

    it 'has an description' do
      expect(subject).to eq('Test')
    end
  end

  describe 'validate an supply' do
    let(:supply) { build(:supply) }

    subject { supply }

    it 'validate supply' do
      expect(subject).to_not be_valid
    end
  end

  describe 'test validates has stock' do
    let(:supply) { build(:supply, stock: nil) }

    subject { supply }

    it 'is not valid without a stock' do
      expect(subject).to_not be_valid
    end
  end
end