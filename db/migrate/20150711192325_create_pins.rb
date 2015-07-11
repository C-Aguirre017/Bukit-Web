class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.references :user, index: true, foreign_key: true
      t.datetime :publication
      t.datetime :realization
      t.integer :duration
      t.string :title
      t.string :description
      t.integer :price
      t.integer :help_type
      t.string :faculty
      t.float :latitude
      t.float :longitude
      t.references :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
