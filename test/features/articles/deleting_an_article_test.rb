require "test_helper"

feature "Deleting an article" do
  scenario "is successful when user clicks destroy link" do
    article = articles(:two)
    visit article_path(article)
    find('body').must_have_content "Second Post"
    click_link "Destroy"
    page.text.must_include "Listing Articles"
    page.text.wont_include article.title
  end
end
