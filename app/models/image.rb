class Image < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :tileset_name, :date_taken, :description, :camera_type
  validates_presence_of :image_file
end
