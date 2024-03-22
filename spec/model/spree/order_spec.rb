require "spec_helper"

RSpec.describe Spree::Order do
  let(:order) { create :order }
  let(:user) { create :admin_user }

  describe "acts_as_commentable" do
    describe "#comments" do
      subject { order.comments }

      context "when there are no comments" do
        it { is_expected.to be_empty }
      end

      context "when there are comments" do
        it "returns a collection of comments" do
          expect {
            order.comments.create! title: "Title",
              comment: "Comment.",
              user: user
          }
            .to change { order.reload.comments.to_a }
            .from([])
            .to([instance_of(Spree::Comment)])

          expect(order.comments.first.attributes).to include(
            "title" => "Title",
            "comment" => "Comment.",
            "user_id" => user.id
          )
        end
      end
    end
  end
end
