require "rails_helper"

RSpec.describe User, :type => :model do

  describe 'full name' do
    let(:user) { build(:user, first_name: "Jhon", last_name: "Smith") }

    subject { user.full_name }

    it 'should return the full name of an user' do
      expect(subject).to eq("Jhon Smith")
    end
  end

  describe 'user contain an email' do
    let(:user) { build(:user, email: "homer@gmail.com") }

    subject { user.email }

    it "has an email" do
      expect(subject).to eq("homer@gmail.com")
    end
  end

  describe 'validate an user' do
    let(:user) { build(:user) }

    subject { user }

    it "validate user" do
      expect(subject).to be_valid
    end
  end

  describe 'test validates has first_name' do
    let(:user) { build(:user, first_name: nil) }

    subject { user }

    it "is not valid without a first_name" do
      expect(subject).to_not be_valid
    end
  end

  describe 'test validates has last_name' do
    let(:user) { build(:user, last_name: nil) }

    subject { user }

    it "is not valid without a last_name" do
      expect(subject).to_not be_valid
    end
  end

  describe 'test validates has email' do
    let(:user) { build(:user, last_name: nil) }

    subject { user }

    it "is not valid without a email" do
      expect(subject).to_not be_valid
    end
  end
end