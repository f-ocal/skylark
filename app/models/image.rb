class Image < ActiveRecord::Base
  belongs_to :user

  acts_as_votable

  validates_presence_of :tileset_name, :date_taken, :description, :camera_type
end
