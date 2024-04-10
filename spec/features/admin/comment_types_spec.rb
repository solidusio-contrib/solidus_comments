# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Comment Types', :js do
  before { login_as_admin }

  it 'adds a menu item in settings' do
    visit spree.edit_admin_general_settings_path

    expect(page).to have_current_path "/admin/stores"
    expect(page).to have_text(/Comment Types/i)
  end

  it 'adds a new comment type' do
    visit spree.new_admin_comment_type_path

    fill_in 'Name', with: 'Some name'
    click_button 'Create'

    expect(page).to have_text('Some name')
  end
end
