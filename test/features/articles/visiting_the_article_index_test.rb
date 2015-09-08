require "test_helper"

feature "Visiting the Article Index" do
  scenario "with existing articles, show list" do
    article = articles(:one)
    article.save
    visit articles_path
    page.must_have_content article.title
    page.must_have_content article.body
  end
end
