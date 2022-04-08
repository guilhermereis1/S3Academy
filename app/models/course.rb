# == Schema Information
#
# Table name: courses
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  subtitle   :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Course < ApplicationRecord
  has_one_attached :image_course
  has_many :sections, -> { order(position: :asc) }, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  default_scope { order(created_at: :desc) }

  enum status: { active: 0, inactive: 1 }
end
