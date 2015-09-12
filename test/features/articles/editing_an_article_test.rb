require "test_helper"

feature "Editing an article" do
  before do
    @article = articles(:one)
    @article.save
  end

  scenario "will update article if user is the author" do
    sign_in(:wilbur)
    visit article_path(@article)
    page.must_have_content @article.title
    click_link "Edit"
    page.must_have_content "Editing Article"
    fill_in "Title", with: "This is my First Post"
    fill_in "Body", with: "Welcome to my first post."
    click_on "Update Article"
    page.must_have_content "Article was successfully updated."
    page.must_have_content "This is my First Post"
    page.must_have_content "Welcome to my first post."
  end

  scenario "will update article if user is the editor" do
    sign_in(:editor)
    visit article_path(@article)
    click_link "Edit"
    fill_in "Title", with: "Edit This Title"
    click_on "Update Article"
    page.text.must_include "Edit This Title"
  end

  scenario "redirects visitors who are not signed in" do
    visit edit_article_path(@article)
    page.text.must_include "You need to sign in or sign up before continuing."
  end

  scenario "redirects visitors who are signed in" do
    sign_in(:benji)
    visit edit_article_path(@article)
    page.text.must_include "You are not authorized to perform this action."
  end

  scenario "link will not show up for visitors" do
    visit article_path(@article)
    page.text.wont_include "Edit"
  end

  scenario "link will show up for article authors" do
    sign_in(:wilbur)
    visit article_path(@article)
    page.text.must_include "Edit"
  end

  scenario "link will not show up for different authors" do
    sign_in(:author)
    visit article_path(@article)
    page.text.wont_include "Edit"
  end
end
