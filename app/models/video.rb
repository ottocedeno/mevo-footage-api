class Video < ApplicationRecord
  belongs_to :category
  belongs_to :camera
  
  validates :title, presence: true
  validates :description, presence: true
  validates :user_email, presence: true
  validates :youtube_url, presence: true

  validates :authorized_to_share, inclusion: {in: [true], message: "Must authorize usage of this video."}
end
