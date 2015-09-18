class AddFeaturedImageToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :featured, :string
  end
end
