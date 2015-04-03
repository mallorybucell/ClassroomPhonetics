class DescriptionUserCourseLabel < ActiveRecord::Migration
  def change
    rename_column :user_courses, :course_role, :user_role
  end
end
