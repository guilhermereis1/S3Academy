# == Schema Information
#
# Table name: notifications
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Notification < ApplicationRecord
end
