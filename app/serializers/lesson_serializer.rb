class LessonSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :content, :position, :created_at, :updated_at, :thumbnail, :video

  def thumbnail
    "#{ENV['HOST_URL']}#{rails_blob_path(object.thumbnail, only_path: true)}" if object.thumbnail.attached?
  end

  def video
    "#{ENV['HOST_URL']}#{rails_blob_path(object.video, only_path: true)}" if object.video.attached?
  end
end