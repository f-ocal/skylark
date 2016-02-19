class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.belongs_to :user, index: true

      t.string :title, null: false
      t.string :tileset, null: false
      t.date :date_taken
      t.text :description
      t.string :camera_type

      t.timestamps null: false
    end
  end
end
