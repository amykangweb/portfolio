class AddImageToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :image, :string
    add_column :projects, :extra, :string
  end
end
