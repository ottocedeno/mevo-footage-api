class Video < ApplicationRecord
  belongs_to :category
  belongs_to :camera

  before_create :set_verified_to_false
  
  validates :title, presence: {message: "Title can't be blank"}
  validates :description, presence: {message: "Description can't be blank"}
  validates :user_email, presence: {message: "Email can't be blank"}
  validates :user_email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Must be a valid email." } 
  validates :youtube_url, presence: {message: "Youtube URL can't be blank"}
  validates :youtube_url, format: {with: /(https?\:\/\/)?(www\.)?(youtube\.com|youtu\.?be)\/.+/, message: "Must be a valid YouTube link."}
  validates :authorized_to_share, inclusion: {in: [true], message: "Must authorize usage of this video."}

  def self.filter_by_camera(camera_model)
    self.all.select {|video| video.camera.model == camera_model}
  end

  def self.filter_by_category(category_name)
    self.all.select {|video| video.category.name == category_name}
  end

  def self.filter_by_camera_and_category(camera_model, category_name)
    self.all.select {|video| video.camera.model == camera_model && video.category.name == category_name}
  end



  def errors_to_strings
    error_strings = []
    if !!self.errors
      self.errors.messages.each_value do |msgArray|
        msgArray.each {|msg| error_strings << msg} 
      end
    end

    error_strings
  end

  private
  def set_verified_to_false
    self.verified = false
  end

  
end
