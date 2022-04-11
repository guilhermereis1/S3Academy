class LessonSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :content, :position, :created_at, :updated_at, :thumbnail, :video, :comments

  def thumbnail
    "#{ENV['HOST_URL']}#{rails_blob_path(object.thumbnail, only_path: true)}" if object.thumbnail.attached?
  end

  def video
    "#{ENV['HOST_URL']}#{rails_blob_path(object.video, only_path: true)}" if object.video.attached?
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