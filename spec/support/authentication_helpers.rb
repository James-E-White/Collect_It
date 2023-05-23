# spec/support/authentication_helpers.rb
RSpec.configure do |config|
#   config.include Devise::Test::IntegrationHelpers

  def login_user(user)
    sign_in user
  end
end
