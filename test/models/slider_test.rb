# == Schema Information
#
# Table name: sliders
#
#  id         :uuid             not null, primary key
#  name       :string
#  active     :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class SliderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
