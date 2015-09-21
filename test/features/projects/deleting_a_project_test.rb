require "test_helper"

feature "Deleting a project" do
  scenario "is successful" do
    sign_in(:editor)
    project = projects(:one)
    visit project_path(project)
    click_link 'Destroy'
    page.text.must_include "Projects"
    page.text.wont_include project.name
  end

  scenario "link is not shown to visitors" do
    visit project_path(projects(:one))
    page.text.wont_include "Edit"
  end

  scenario "link is not shown to authors" do
    sign_in(:wilbur)
    visit project_path(projects(:one))
    page.text.wont_include "Edit"
  end

  scenario "link is not shown to signed in users" do
    visit project_path(projects(:one))
    page.text.wont_include "Edit"
  end
end
