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
require "test_helper"

class LessonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
