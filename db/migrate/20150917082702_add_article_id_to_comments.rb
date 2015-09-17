class AddArticleIdToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :article, index: true
  end
end
