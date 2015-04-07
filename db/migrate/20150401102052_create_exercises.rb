class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :exercise_type
      t.integer :forvo_id
      t.text :content

      t.timestamps null: false
    end
  end
end
