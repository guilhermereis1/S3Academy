# == Schema Information
#
# Table name: students
#
#  id                     :uuid             not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  status                 :integer          default("active")
#  registration           :string
#
class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable, :registerable
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  enum status: { active: 0, inactive: 1 }

  after_create :registration_student

  def registration_student
    self.registration = SecureRandom.hex(7).upcase
  end
end
