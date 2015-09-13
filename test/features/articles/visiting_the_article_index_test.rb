require "test_helper"

feature "Visiting the Article Index" do
  scenario "shows published articles for visitors" do
    article = articles(:one)
    article.save
    visit articles_path
    page.must_have_content article.title
  end

  scenario "only shows published articles for non-editors" do
    article = articles(:two)
    article.save
    visit articles_path
    page.text.wont_include "Second Post"
    sign_in(:editor)
    page.text.must_include "Second Post"
  end
end
