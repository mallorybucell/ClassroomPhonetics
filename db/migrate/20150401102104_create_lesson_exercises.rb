class CreateLessonExercises < ActiveRecord::Migration
  def change
    create_table :lesson_exercises do |t|
      t.belongs_to :lesson, index: true
      t.belongs_to :exercise, index: true

      t.timestamps null: false
    end
    add_foreign_key :lesson_exercises, :lessons
    add_foreign_key :lesson_exercises, :exercises
  end
end
