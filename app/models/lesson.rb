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
#  position   :integer
#
class Lesson < ApplicationRecord
  belongs_to :section
  has_one_attached :video
  acts_as_list scope: :section
end
