class UpdateExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :answer_key, :string
  end
end
