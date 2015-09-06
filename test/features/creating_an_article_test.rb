require "test_helper"

feature "Creating an Article" do
  scenario "submit form data to create a new article" do
    article = articles(:two)
    visit new_article_path
    page.must_have_content "New Article"
    fill_in "Title", with: article.title
    fill_in "Body", with: article.body
    click_on "Create Article"
    page.must_have_content "Article was successfully created."
    page.must_have_content article.title
    page.must_have_content article.body
  end
end
