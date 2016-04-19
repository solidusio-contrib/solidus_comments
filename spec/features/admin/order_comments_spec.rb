require 'spec_helper'

RSpec.feature 'Order Comments', :js do
  let!(:order) { create(:completed_order_with_totals) }

  before :each do
    login_as_admin
  end

  it "adding comments" do
    visit spree.comments_admin_order_path(order)
    expect(page).to have_text('NO COMMENTS FOUND')

    fill_in 'Comment', with: 'A test comment.'
    click_button 'Add Comment'

    expect(page).to have_text('Comments (1)')
    expect(page).to have_text('A test comment.')
  end
end
