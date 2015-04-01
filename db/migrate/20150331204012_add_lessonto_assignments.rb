class AddLessontoAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :lesson_id, :belongs_to
  end
end
