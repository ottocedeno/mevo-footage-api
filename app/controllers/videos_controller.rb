class VideosController < ApplicationController

  def index
    videos = filtered_videos(params[:camera], params[:category])
    render json: VideoSerializer.new(videos).to_serialized_json, status: :ok
  end

  def create
    video = Video.new(video_data)
    if video.valid?
      video.save
      render json: {message: "Successful submission"}, status: :ok
    else
      render json: {errors: video.errors_to_strings}, status: :not_acceptable
    end
  end

  private

  # Methods for GET Video requests ...
  def filtered_videos(camera, category)
    if camera =="All" && category =="All"
      Video.all     
    elsif camera =="All" && category !="All"
      Video.filter_by_category(category)
    elsif camera !="All" && category =="All"
      Video.filter_by_camera(camera)
    else
      Video.filter_by_camera_and_category(camera, category)
    end
  end

  # Methods for POST requests ...
  def video_params
    params.require(:video).permit(:title, :description, :youtube_url, :user_email, :model, :category_name, :authorized_to_share)
  end

  def video_data
    video = {
      title: video_params[:title],
      description: video_params[:description],
      youtube_url: video_params[:youtube_url],
      user_email: video_params[:user_email],
      authorized_to_share: video_params[:authorized_to_share],
      category: find_category,
      camera: find_camera
    }
  end

  def find_category
    category = Category.find_by(name: video_params[:category_name])
  end

  def find_camera
    camera = Camera.find_by(model: video_params[:model])
  end
end
