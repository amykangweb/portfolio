require "test_helper"

feature "Deleting an article" do
  scenario "is successful when user clicks destroy link" do
    article = articles(:two)
    visit article_path(article)
    find('body').must_have_content "Second Post"
    click_link "Destroy"
    # Unfinished due to Ambiguous matches xpath /html error
  end
end
