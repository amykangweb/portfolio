Rails.env = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require "minitest/pride"
require "minitest/reporters"
require "selenium-webdriver"

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
  def sign_in(role = :editor)
    @user = users(role)
    visit new_user_session_path
    within(".d_mail") do
        fill_in "Email", with: @user.email
    end
    fill_in "Password", with: "password"
    click_on "Log in"
    page.text.must_include "Signed in successfully."
  end

  def create_article
    @article = articles(:one)
    visit new_article_path
    page.must_have_content "New Article"
    fill_in "Title", with: @article.title
    fill_in "Body", with: @article.body
    click_on "Create Article"
  end
end
