require 'spec_helper'

# rubocop:disable Metrics/BlockLength
RSpec.feature 'Order Comments', :js do
  let!(:order) { create(:completed_order_with_totals) }

  before :each do
    login_as_admin
  end

  it 'adding comments' do
    visit spree.comments_admin_order_path(order)
    expect(page).to have_text(/No Comments found/i)

    fill_in 'Comment', with: 'A test comment.'
    click_button 'Add Comment'

    # uppercase < v1.2, sentence case >= v1.3
    expect(page).to have_text(/Comments \(1\)/i)
    expect(page).to have_text('A test comment.')
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

    it 'should not display form' do
      visit spree.comments_admin_order_path(order)

      expect(page).to have_text(/No Comments found/i)
      expect(page).to_not have_text 'Add Comment'
    end
  end
end
# rubocop:enable Metrics/BlockLength
