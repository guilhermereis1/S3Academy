# == Schema Information
#
# Table name: subscriptions
#
#  id         :uuid             not null, primary key
#  student_id :uuid             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :uuid             not null
#
class Subscription < ApplicationRecord
  belongs_to :student
  belongs_to :course

  validates :student_id, uniqueness: { scope: :course_id }
end
