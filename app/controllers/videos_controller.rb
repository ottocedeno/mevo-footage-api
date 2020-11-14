class VideosController < ApplicationController
  def create
    video = Video.new(video_data)
    byebug
  end

  private
  def video_params
    params.require(:video).permit(:title, :description, :youtube_url, :user_email, :model, :category_name, :authorized_to_share)
  end

  def find_category
    category = Category.find_by(name: video_params[:category_name])
  end

  def find_camera
    camera = Camera.find_by(model: video_params[:model])
  end

  def video_data
    video = {
      title: video_params[:title],
      description: video_params[:title],
      youtube_url: video_params[:youtube_url],
      user_email: video_params[:user_email],
      authorized_to_share: video_params[:authorized_to_share],
      category: find_category,
      camera: find_camera
    }
  end
end
