class Video < ApplicationRecord
  belongs_to :category
  belongs_to :camera
  
  validates :title, presence: true
  validates :description, presence: true
  validates :user_email, presence: true
  validates :youtube_url, presence: true

end
