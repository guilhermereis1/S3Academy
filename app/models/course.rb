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
#  status     :integer          default("inactive")
#  slug       :string
#
class Course < ApplicationRecord
  has_one_attached :image_course, dependent: :destroy
  has_many :sections, -> { order(position: :asc) }, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  default_scope { order(created_at: :desc) }

  enum status: { active: 0, inactive: 1 }

  extend FriendlyId
  friendly_id :name, use: :slugged
end
