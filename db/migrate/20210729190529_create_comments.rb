class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :student, null: false, foreign_key: true
      t.references :lesson, null: false, foreign_key: true
      t.text :content, null: false
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
