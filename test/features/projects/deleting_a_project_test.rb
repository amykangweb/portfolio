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
end
