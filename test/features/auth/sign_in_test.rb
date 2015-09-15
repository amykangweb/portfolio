require "test_helper"

feature "Omniauth" do
  scenario "sign in with github works" do
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:github,
                            {
                              uid: '12345',
                              info: {
                                nickname: 'test_github_user',
                                email: 'test_github_user@mail.com'
                              },
                              })
    visit new_user_session_path
    Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
    Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]

    click_on "Sign in with Github"
    page.must_have_content "test_github_user, you are signed in!"
  end
end

# Courtesy of: https://gist.github.com/ivanoats/7071730
# with help from https://github.com/intridea/omniauth/wiki/Integration-Testing
