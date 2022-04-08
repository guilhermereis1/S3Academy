# == Schema Information
#
# Table name: lessons
#
#  id         :uuid             not null, primary key
#  section_id :uuid             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string
#  content    :text
#  position   :integer
#
class Lesson < ApplicationRecord
  belongs_to :section, dependent: :destroy
  has_one_attached :thumbnail, dependent: :destroy
  has_one_attached :video, dependent: :destroy
  acts_as_list scope: :section
  has_many :comments, dependent: :destroy
  has_many_attached :lesson_resources, dependent: :destroy

  validates :thumbnail, content_type: [:png, :jpg, :jpeg], size: { less_than: 10.megabytes , message: 'must be less than 10MB in size' }

  validates :video, content_type: [:mp4]
end
