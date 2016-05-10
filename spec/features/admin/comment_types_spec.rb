require 'spec_helper'

RSpec.feature 'Comment Types', :js do
  before { login_as_admin }

  it 'adds a menu item in settings' do
    visit spree.edit_admin_general_settings_path

    # uppercase < v1.2, sentence case >= v1.3
    expect(page).to have_text(/Comment Types/i)
  end

  it 'adds a new comment type' do
    visit spree.new_admin_comment_type_path

    fill_in 'Name', with: 'Some name'
    click_button 'Create'

    expect(page).to have_text('Some name')
  end
end
