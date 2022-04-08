# == Schema Information
#
# Table name: sections
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  course_id  :uuid             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  position   :integer
#
class Section < ApplicationRecord
  belongs_to :course
  acts_as_list scope: :course
  has_many :lessons, -> { order(position: :asc) }, dependent: :destroy
end
