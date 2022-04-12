class CommentsLessonSerializer < ActiveModel::Serializer
  # include Rails.application.routes.url_helpers
  attributes :id, :content, :student, :status, :created_at, :updated_at

  # def image_course
  #   "#{ENV['HOST_URL']}#{rails_blob_path(object.image_course, only_path: true)}" if object.image_course.attached?
  # end
end