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
class Slider < ApplicationRecord
  has_one_attached :image

  after_create :add_filename_to_name

  def add_filename_to_name
    if self.name.blank?
      self.name = self.image.filename.to_s
      self.save
    end
  end
end
