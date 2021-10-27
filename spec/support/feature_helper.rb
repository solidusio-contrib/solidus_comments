# frozen_string_literal: true

module FeatureHelper
  def login_as_admin
    admin = FactoryBot.create(:admin_user, password: "boxen1011")

    visit spree.admin_path
    fill_in "Email", with: admin.email
    fill_in "Password", with: "boxen1011"
    click_button "Login"

    admin
  end
end

RSpec.configure do |config|
  config.include FeatureHelper, type: :feature
end
