class AddCourseToSubscription < ActiveRecord::Migration[6.1]
  def change
    add_reference :subscriptions, :course, null: false, foreign_key: true, type: :uuid
  end
end
