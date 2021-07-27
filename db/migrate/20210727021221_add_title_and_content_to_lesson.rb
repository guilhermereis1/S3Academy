class AddTitleAndContentToLesson < ActiveRecord::Migration[6.1]
  def change
    add_column :lessons, :title, :string
    add_column :lessons, :content, :text
  end
end
