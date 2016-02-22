class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.belongs_to :user, index: true

      t.string :tileset_name
      t.string :map
      t.date :date_taken
      t.text :description
      t.string :camera_type
      t.string :image_file

      t.timestamps null: false
    end
  end
end
