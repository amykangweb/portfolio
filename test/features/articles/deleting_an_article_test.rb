require "test_helper"

feature "Deleting an article" do
  before do
    @article = articles(:one)
    @article.save
  end

  scenario "is successful when editor clicks destroy link" do
    sign_in(:editor)
    article = articles(:one)
    visit article_path(article)
    find('body').must_have_content "First Post"
    click_link "Destroy"
    page.text.must_include "Article was successfully destroyed."
    page.text.wont_include article.title
  end

  scenario "link is shown to editor" do
    sign_in(:editor)
    visit article_path(@article)
    page.text.must_include "Destroy"
  end

  scenario "link is not shown if user is not signed in" do
    visit article_path(@article)
    page.text.wont_include "Destroy"
  end

  scenario "link is not shown if user is not the editor" do
    sign_in(:wilbur)
    visit article_path(@article)
    page.text.wont_include "Destroy"
  end
end
