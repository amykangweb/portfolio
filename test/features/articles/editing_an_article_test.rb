require "test_helper"

feature "Editing an article" do
  before do
    sign_in
  end

  scenario "will update article with new content" do
    article = articles(:one)
    visit article_path(article)
    page.must_have_content article.title
    click_link "Edit"
    page.must_have_content "Editing Article"
    fill_in "Title", with: "This is my First Post"
    fill_in "Body", with: "Welcome to my first post."
    click_on "Update Article"
    page.must_have_content "Article was successfully updated."
    page.must_have_content "This is my First Post"
    page.must_have_content "Welcome to my first post."
  end
end
