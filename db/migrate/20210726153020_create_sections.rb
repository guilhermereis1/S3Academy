class CreateSections < ActiveRecord::Migration[6.1]
  def change
    create_table :sections do |t|
      t.string :name, null: false
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
