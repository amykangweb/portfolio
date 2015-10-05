class AddSiteLinkAndSourceLinkToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :site, :string
    add_column :projects, :source, :string
  end
end
