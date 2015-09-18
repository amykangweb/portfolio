class ProjectPolicy < ApplicationPolicy

  def is_editor?
    user.editor?
  end
end
