require "test_helper"

feature "Deleting an article" do
  before do
    sign_in
  end

  scenario "is successful when user clicks destroy link" do
    article = articles(:two)
    article.save
    visit article_path(article)
    find('body').must_have_content "Second Post"
    click_link "Destroy"
    page.text.must_include "Listing Articles"
    page.text.must_include "Article was successfully destroyed."
    page.text.wont_include article.title
  end
end
