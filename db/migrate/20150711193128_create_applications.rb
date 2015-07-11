class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.references :pin, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.boolean :reached

      t.timestamps null: false
    end
  end
end
