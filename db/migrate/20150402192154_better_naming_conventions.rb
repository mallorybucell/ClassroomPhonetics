class BetterNamingConventions < ActiveRecord::Migration
  def change
    rename_column :assignments, :user_id,               :student_id
    rename_column :lessons,     :created_by_id,         :created_by_teacher_id
    add_column    :forvos,      :added_by_teacher_id,   :integer
    add_column    :exercises,   :created_by_teacher_id, :integer
  end
end
