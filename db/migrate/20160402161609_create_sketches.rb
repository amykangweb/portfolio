class CreateSketches < ActiveRecord::Migration
  def change
    create_table :sketches do |t|
      t.string :image
      t.text :description
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
