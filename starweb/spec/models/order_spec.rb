require "rails_helper"

RSpec.describe Order, :type => :model do

  describe 'order contain an state' do
    let(:order) { build(:order, state: "En espera") }

    subject { order.state }

    it "has an state" do
      expect(subject).to eq("En espera")
    end
  end

  describe 'order contain an paid' do
    let(:order) { build(:order, paid: "Pagado") }

    subject { order.paid }

    it "has an paid" do
      expect(subject).to eq("Pagado")
    end
  end

  describe 'test validates has deliver_date' do
    let(:order) { build(:order, deliver_date: nil) }

    subject { order }

    it "is not valid without a deliver_date" do
      expect(subject).to_not be_valid
    end
  end

  describe 'test validates has course_club' do
    let(:order) { build(:order, course_club: nil) }

    subject { order }

    it "is not valid without a course_club" do
      expect(subject).to_not be_valid
    end
  end

  describe 'order contain an course_club' do
    let(:order) { build(:order, course_club: "CREE") }

    subject { order.course_club }

    it "has an course_club" do
      expect(subject).to eq("CREE")
    end
  end

  describe 'validate an order' do
    let(:order) { build(:order) }

    subject { order }

    it "validate order" do
      expect(subject).to_not be_valid
    end
  end
end