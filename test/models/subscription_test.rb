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
require "test_helper"

class SubscriptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
