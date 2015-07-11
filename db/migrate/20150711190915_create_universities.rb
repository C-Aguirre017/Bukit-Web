class CreateUniversities < ActiveRecord::Migration
  def change
    create_table :universities do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
