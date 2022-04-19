class SectionSerializer < ActiveModel::Serializer
  attributes :id, :name, :position, :course, :lessons

  has_many :lessons, serializer: LessonSerializer
end