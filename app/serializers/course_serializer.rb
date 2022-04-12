class CourseSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :subtitle, :content, :created_at, :updated_at, :status, :slug, :image_course, :sections, :first_lesson_video, :first_lesson_thumbnail, :first_lesson

  has_many :sections, serializer: SectionSerializer

  def image_course
    "#{ENV['HOST_URL']}#{rails_blob_path(object.image_course, only_path: true)}" if object.image_course.attached?
  end

  def first_lesson
    object.sections.first.lessons.first
  end

  def first_lesson_video
    object.sections.first.lessons.first.video.attached? ? "#{ENV['HOST_URL']}#{rails_blob_path(object.sections.first.lessons.first.video, only_path: true)}" : nil
  end

  def first_lesson_thumbnail
    object.sections.first.lessons.first.thumbnail.attached? ? "#{ENV['HOST_URL']}#{rails_blob_path(object.sections.first.lessons.first.thumbnail, only_path: true)}" : nil
  end
end