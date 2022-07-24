class LessonSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :content, :position, :created_at, :updated_at, :thumbnail, :video, :lesson_resources

  def thumbnail
    "#{ENV['HOST_URL']}#{rails_blob_path(object.thumbnail, only_path: true)}" if object.thumbnail.attached?
  end

  def video
    "#{ENV['HOST_URL']}#{rails_blob_path(object.video, only_path: true)}" if object.video.attached?
  end

  def lesson_resources
    object.lesson_resources.map do |resource|
      {
        id: resource.id,
        filename: resource.filename.to_s,
        content_type: resource.content_type.to_s,
        url: "#{ENV['HOST_URL']}#{rails_blob_path(resource, only_path: true)}",
        lesson_id: object.id
      }
    end
  end

  def comments
    object.comments.map do |comment|
      {
        id: comment.id,
        content: comment.content,
        created_at: comment.created_at,
        student: {
          id: comment.student.id,
          email: comment.student.email,
          avatar: comment.student.avatar.attached? ? "#{ENV['HOST_URL']}#{rails_blob_path(comment.student.avatar, only_path: true)}" : nil
        }
      }
    end
  end
end