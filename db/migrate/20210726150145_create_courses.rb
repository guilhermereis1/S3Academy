class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses, id: :uuid do |t|
      t.string :name, null: false
      t.string :subtitle
      t.text :content

      t.timestamps
    end
  end
end
