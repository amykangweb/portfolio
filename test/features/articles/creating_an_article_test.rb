require "test_helper"

feature "Creating an Article" do
  scenario "returns success if user is an author" do
    sign_in(:wilbur)
    create_article
    page.must_have_content "Article was successfully created."
    page.must_have_content @article.title
    page.must_have_content @article.body
  end

  scenario "returns success if user is the editor" do
    sign_in(:editor)
    create_article
    page.must_have_content "Article was successfully created."
    page.must_have_content @article.title
    page.must_have_content @article.body
  end

  scenario "must show author name on article page" do
    sign_in(:wilbur)
    create_article
    page.has_css? "#author"
    page.text.must_include @user.name
  end

  scenario "must show status as unpublished" do
    sign_in(:wilbur)
    create_article
    assert page.has_css?(".fi-lock"), "Expected to find unpublished icon, none found."
  end

  scenario "returns error message for visitors" do
    visit new_article_path
    page.must_have_content "You need to sign in or sign up before continuing"
  end

  scenario "button will not appear for visitors" do
    visit articles_path
    page.wont_have_link "New Article"
  end

  scenario "redirects unauthorized visitors" do
    sign_in(:benji)
    visit new_article_path
    page.text.must_include "You are not authorized to perform this action."
  end

  scenario "authors can't publish" do
    sign_in(:wilbur)
    visit new_article_path
    page.wont_have_field('Published')
  end

  scenario "editors can publish" do
    sign_in(:editor)
    visit new_article_path
    page.must_have_field('Published')
    fill_in "Title", with: articles(:one).title
    fill_in "Body", with: articles(:one).body
    check "Published"
    click_on "Create Article"
    assert page.has_no_css?(".fi-lock"), "Expected not to find lock icon, icon found."
  end
end
