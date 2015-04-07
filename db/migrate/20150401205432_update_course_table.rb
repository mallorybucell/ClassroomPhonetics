class UpdateCourseTable < ActiveRecord::Migration
  def change
    rename_column :courses, :course_id, :internal_id
  end
end
