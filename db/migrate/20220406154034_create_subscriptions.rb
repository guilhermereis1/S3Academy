class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions, id: :uuid do |t|
      t.references :student, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
