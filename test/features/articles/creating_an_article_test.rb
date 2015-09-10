require "test_helper"

feature "Creating an Article" do
  before do
    sign_in
    @article = articles(:two)
    visit new_article_path
    page.must_have_content "New Article"
    fill_in "Title", with: @article.title
    fill_in "Body", with: @article.body
    click_on "Create Article"
  end

  scenario "submit form data to create a new article" do
    page.must_have_content "Article was successfully created."
    page.must_have_content @article.title
    page.must_have_content @article.body
  end

  scenario "article must show author name" do
    page.has_css? "#author"
    page.text.must_include @user.email
  end
end
