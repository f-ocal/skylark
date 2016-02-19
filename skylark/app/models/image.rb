class Image < ActiveRecord::Base
  belongs_to :customer

  validates :title, :tileset, presence: true
end
