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
require "test_helper"

class SubscriptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
