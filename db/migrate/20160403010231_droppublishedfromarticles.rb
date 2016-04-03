class Droppublishedfromarticles < ActiveRecord::Migration
  def change
    remove_column :articles, :published
  end
end
