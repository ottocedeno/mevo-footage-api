class Video < ApplicationRecord
  belongs_to :category
  belongs_to :camera
  
  validates :title, presence: true
  validates :description, presence: true
  validates :user_email, presence: true
  validates :user_email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Must be a valid email." } 
  validates :youtube_url, presence: true
  validates :youtube_url, format: {with: /(https?\:\/\/)?(www\.)?(youtube\.com|youtu\.?be)\/.+/, message: "Must be a valid YouTube link."}

  validates :authorized_to_share, inclusion: {in: [true], message: "Must authorize usage of this video."}
end
