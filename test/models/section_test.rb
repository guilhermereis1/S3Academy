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
require "test_helper"

class SectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
