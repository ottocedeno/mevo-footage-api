class ApplicationController < ActionController::API
  def index
    categories = Category.all_category_names
    cameras = Camera.all_camera_models
    render json: {categories: categories, cameras: cameras}, status: :ok
  end
end
