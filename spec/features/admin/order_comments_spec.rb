# frozen_string_literal: true

# FIXME:
# None of these tests exercise creating or viewing comments with an assigned
# comment type.
#
require 'spec_helper'
RSpec.describe 'Order Comments', :js do
  let!(:order) { create(:completed_order_with_totals) }

  before do
    login_as_admin
  end

  it 'adding comments to an order' do
    visit spree.comments_admin_order_path(order)
    expect(page).to have_text(/No Comments found/i)

    click_button 'Add Comment'
    expect(page).to have_text('Comment can\'t be blank')

    fill_in 'Comment', with: 'A test comment.'
    click_button 'Add Comment'

    within "table.solidus-comments-comment-list" do
      expect(page).to have_text "A test comment"
    end
  end

  context 'without permission' do
    let(:comment) { order.comments.new }

    before do
      # Stub for not allowing user to have comment permissions on the order.
      # Works with just the default stub for multiple instances.
      allow_any_instance_of(CanCan::Ability)
        .to receive(:can?).and_return(false)
      # Stub normal permissions in order to override create comment permission.
      allow_any_instance_of(CanCan::Ability)
        .to receive(:can?).with(:admin, Spree::Order).and_return(true)
      allow_any_instance_of(CanCan::Ability)
        .to receive(:can?).with(:comments, Spree::Order).and_return(true)
      allow_any_instance_of(CanCan::Ability)
        .to receive(:can?).with(:update, order).and_return(true)
      allow_any_instance_of(CanCan::Ability)
        .to receive(:can?).with(:display, Spree::Adjustment).and_return(true)
      allow_any_instance_of(CanCan::Ability)
        .to receive(:can?).with(:display, Spree::Payment).and_return(true)
      allow_any_instance_of(CanCan::Ability)
        .to receive(:can?)
        .with(:display, Spree::ReturnAuthorization).and_return(true)
      allow_any_instance_of(CanCan::Ability)
        .to receive(:can?)
        .with(:display, Spree::CustomerReturn).and_return(true)
      allow_any_instance_of(CanCan::Ability)
        .to receive(:can?)
        .with(:manage, Spree::OrderCancellations).and_return(true)
    end

    it 'does not display form' do
      visit spree.comments_admin_order_path(order)

      expect(page).to have_text(/No Comments found/i)
      expect(page).not_to have_text 'Add Comment'
    end
  end
end
