# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  student_id :bigint           not null
#  lesson_id  :bigint           not null
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
