class Video < ApplicationRecord
  belongs_to :category
  belongs_to :camera
end
