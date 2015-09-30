require "test_helper"

feature "Comment notification" do
  scenario "has correct content" do
    email = CommentMailer.create_comment(users(:wilbur), comments(:one))
    email.must have_header("from", "portfolio@amykang.net")
    email.must have_header("to", "selene6023@gmail.com")
  end
end
