class CoursesSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :subtitle, :content, :created_at, :updated_at, :status, :slug, :image_course

  def image_course
    "#{ENV['HOST_URL']}#{rails_blob_path(object.image_course, only_path: true)}" if object.image_course.attached?
  end
end