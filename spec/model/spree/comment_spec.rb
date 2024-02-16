require "spec_helper"

RSpec.describe Spree::Comment do
  let(:commentable) { create :shipment }
  let(:user) { create :admin_user }

  let!(:older_comment) {
    comment = described_class.create! comment: "Text",
      commentable: commentable,
      user: user
    comment.update_column :created_at, 10.days.ago
    comment
  }
  let!(:newer_comment) {
    comment = described_class.create! comment: "Text",
      commentable: commentable,
      user: user
    comment.update_column :created_at, 1.minute.ago
    comment
  }

  describe ".all" do
    subject { described_class.all }

    it "returns comments in chronological order" do
      expect(subject).to eq [older_comment, newer_comment]
    end
  end

  describe ".recent" do
    subject { described_class.recent }

    it "returns comments in reverse-chronological order" do
      expect(subject).to eq [newer_comment, older_comment]
    end
  end

  describe "#valid?" do
    subject { comment.valid? }

    context "when the comment is empty" do
      let(:comment) {
        described_class.new comment: nil,
          commentable: commentable,
          user: user
      }

      it { is_expected.to eq false }
    end

    context "when the comment has text" do
      let(:comment) {
        described_class.new comment: "Text",
          commentable: commentable,
          user: user
      }

      it { is_expected.to eq true }
    end
  end
end
