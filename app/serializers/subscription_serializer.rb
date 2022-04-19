class SubscriptionSerializer < ActiveModel::Serializer
  attributes :course

  belongs_to :course, serializer: CoursesSerializer
end