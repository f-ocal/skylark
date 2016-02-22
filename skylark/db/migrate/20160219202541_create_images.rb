class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.belongs_to :user, index: true

      t.string :tileset_name
      t.float :marker_lat
      t.float :marker_long
      t.date :date_taken
      t.text :description
      t.string :camera_type
      t.string :map

      t.timestamps null: false
    end
  end
end
