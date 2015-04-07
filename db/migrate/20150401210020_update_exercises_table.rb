class UpdateExercisesTable < ActiveRecord::Migration
  def change
    rename_column :exercises, :exercise_type, :exercise_code
  end
end
