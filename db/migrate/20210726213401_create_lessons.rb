class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons, id: :uuid do |t|
      t.references :section, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
