require 'test_helper'

feature 'Author control page' do
  before do
    @article = articles(:one)
    @article.save
    @article2 = articles(:two)
    @article2.save
    @article3 = articles(:three)
    @article3.save
    @user = users(:wilbur)
  end

  scenario "shows only author's posts" do
    sign_in(:wilbur)
    click_link "Control Panel"
    page.text.must_include "wilbur@mail.com's Control Panel"
    page.text.must_include @article.title
    page.text.must_include @article2.title
    page.text.wont_include @article3.title
  end

  scenario "cannot be accessed by non-authors" do
    visit user_control_path(@user)
    page.text.must_include "You are not authorized to view this page."
    sign_in(:benji)
    visit user_control_path(@user)
    page.text.must_include "You are not authorized to view this page"
  end

  scenario "will not show other author's content" do
    sign_in(:author)
    visit user_control_path(@user)
    page.text.wont_include @article.title
    page.text.wont_include @article2.title
  end
end
