class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments, id: :uuid do |t|
      t.references :student, null: false, foreign_key: true, type: :uuid
      t.references :lesson, null: false, foreign_key: true, type: :uuid
      t.text :content, null: false
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
