require "test_helper"

feature "Creating a comment" do
  before do
    articles(:one).save
  end

  scenario "should send email notification to me" do
    email = CommentMailer.create_comment(users(:wilbur), comments(:one))
    email.must deliver_to("selene6023@gmail.com")
  end

  scenario "shows new comment for signed in user" do
    sign_in(:benji)
    visit article_path(articles(:one))
    fill_in "comment[body]", with: "Test Comment"
    click_on "Create Comment"
    page.text.must_include "Test Comment"
  end

  scenario "shows error message for unauthenticated visitor" do
    visit article_path(articles(:one))
    fill_in "comment[body]", with: "Test Comment"
    click_on "Create Comment"
    page.text.must_include "You need to sign in or sign up before continuing."
  end
end
