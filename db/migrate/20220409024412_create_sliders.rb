class CreateSliders < ActiveRecord::Migration[6.1]
  def change
    create_table :sliders, id: :uuid do |t|
      t.string :name
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
