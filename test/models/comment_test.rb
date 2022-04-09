# == Schema Information
#
# Table name: comments
#
#  id         :uuid             not null, primary key
#  student_id :uuid             not null
#  lesson_id  :uuid             not null
#  content    :text             not null
#  status     :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
