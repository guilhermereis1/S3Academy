# == Schema Information
#
# Table name: subscriptions
#
#  id         :bigint           not null, primary key
#  student_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :bigint           not null
#
class Subscription < ApplicationRecord
  belongs_to :student
  belongs_to :course
end
