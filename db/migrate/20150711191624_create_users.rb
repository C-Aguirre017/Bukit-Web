class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :profession
      t.string :role
      t.string :phone

      t.timestamps null: false
    end
  end
end
