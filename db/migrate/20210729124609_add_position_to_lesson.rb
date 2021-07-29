class AddPositionToLesson < ActiveRecord::Migration[6.1]
  def change
    add_column :lessons, :position, :integer
  end
end
