class ApplicationController < ActionController::API
  def index
    categories = Category.all_category_names
    cameras = Camera.all_camera_models
    options = {categories: categories, cameras: cameras}
    render json: options.to_json, status: :ok
  end
end
