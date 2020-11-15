class Camera < ApplicationRecord
  has_many :videos

  def self.all_camera_models
    Camera.all.map do |cam|
      cam.model
    end
  end
end
