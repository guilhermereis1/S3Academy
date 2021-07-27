# == Schema Information
#
# Table name: lessons
#
#  id         :bigint           not null, primary key
#  section_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string
#  content    :text
#
require "test_helper"

class LessonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
