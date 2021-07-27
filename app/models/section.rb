# == Schema Information
#
# Table name: sections
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  course_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Section < ApplicationRecord
  belongs_to :course
  has_many :lessons, dependent: :destroy
end
