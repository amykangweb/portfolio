require "test_helper"

feature "Deleting comment" do
  before do
    @article = articles(:four)
    @article.save
    @comment = comments(:one)
    @comment.save
  end

  scenario "is allowed to the editor" do
    sign_in(:editor)
    visit article_path(@article)
    within(".comment-controls") do
      click_link "Delete"
    end
    page.text.must_include "Comment was successfully destroyed."
  end

  scenario "link is not shown to non-editors" do
    visit article_path(@article)
    page.text.wont_include "Delete"
    sign_in(:author)
    visit article_path(@article)
    page.text.wont_include "Delete"
  end
end
