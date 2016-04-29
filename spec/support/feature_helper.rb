module FeatureHelper
  def login_as_admin
    admin = create(:admin_user, password: 'test123', password_confirmation: 'test123')
    visit spree.admin_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: 'test123'
    click_button 'Login'
    admin
  end
end
