class CoursesSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :subtitle, :content, :created_at, :updated_at, :status, :slug, :image_course, :count_sections, :total_lessons

  def count_sections
    object.sections.count
  end

  def total_lessons
    object.sections.map { |section| section.lessons.count }.sum
  end

  def image_course
    "#{ENV['HOST_URL']}#{rails_blob_path(object.image_course, only_path: true)}" if object.image_course.attached?
  end
end