class VideoSerializer
  def initialize(video_object)
    @video = video_object
  end

  def to_serialized_json
    @video.to_json(:include => {:camera => {:only => [:model]}, :category => {:only => [:name]}}, :only => [:title, :description, :youtube_url])
  end
end