# == Schema Information
#
# Table name: courses
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  subtitle   :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Course < ApplicationRecord
  has_one_attached :image_course
  has_many :sections, -> { order(position: :asc) }, dependent: :destroy
end
