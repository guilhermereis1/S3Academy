class AddRegistrationToStudent < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :registration, :string
  end
end
