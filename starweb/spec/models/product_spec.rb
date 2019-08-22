require "rails_helper"

RSpec.describe Product, :type => :model do

  describe 'product contain an email' do
    let(:product) { build(:product, name: "Remera") }

    subject { product.name }

    it "has an name" do
      expect(subject).to eq("Remera")
    end
  end

  describe 'validate an product' do
    let(:product) { build(:product) }

    subject { product }

    it "validate product" do
      expect(subject).to_not be_valid
    end
  end

  describe 'test validates has price' do
    let(:product) { build(:product, price: nil) }

    subject { product }

    it "is not valid without a price" do
      expect(subject).to_not be_valid
    end
  end

  describe 'product contain an description' do
    let(:product) { build(:product, description: "test") }

    subject { product.description }

    it "has an description" do
      expect(subject).to eq("test")
    end
  end
end