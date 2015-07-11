class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :initials
      t.string :branch

      t.timestamps null: false
    end
  end
end
