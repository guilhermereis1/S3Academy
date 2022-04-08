class AddStatusToCourse < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :status, :integer, default: 1
  end
end
