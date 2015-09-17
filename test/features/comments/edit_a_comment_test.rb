require "test_helper"

feature "Editing a comment" do
  before do
    @article = articles(:four)
    @article.save
    @comment = comments(:one)
    @comment.save
  end

  scenario "is allowed to signed in commenter" do
    sign_in(:wilbur)
    visit article_path(@article)
    click_link "Edit"
    page.text.must_include "Editing Comment"
    fill_in "Comment", with: "Test Comment"
    click_on "Update Comment"
    page.text.must_include "Test Comment"
  end

  scenario "is not allowed to other signed in users" do
    sign_in(:benji)
    visit article_path(@article)
    page.text.wont_include "Edit"
    visit edit_article_comment_path(@article, @comment)
    page.text.must_include "You are not authorized to perform this action."
  end
end
