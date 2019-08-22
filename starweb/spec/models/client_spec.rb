require "rails_helper"

RSpec.describe Client, :type => :model do

  describe 'user contain an email' do
    let(:client) { build(:client, email: "homer@gmail.com") }

    subject { client.email }

    it "has an email" do
      expect(subject).to eq("homer@gmail.com")
    end
  end

  describe 'validate an client' do
    let(:client) { build(:client) }

    subject { client }

    it "validate client" do
      expect(subject).to be_valid
    end
  end

  describe 'test validates has first_name' do
    let(:client) { build(:client, first_name: nil) }

    subject { client }

    it "is not valid without a first_name" do
      expect(subject).to_not be_valid
    end
  end

  describe 'test validates has last_name' do
    let(:client) { build(:client, last_name: nil) }

    subject { client }

    it "is not valid without a last_name" do
      expect(subject).to_not be_valid
    end
  end

  describe 'test validates has email' do
    let(:client) { build(:client, last_name: nil) }

    subject { client }

    it "is not valid without a email" do
      expect(subject).to_not be_valid
    end
  end
end