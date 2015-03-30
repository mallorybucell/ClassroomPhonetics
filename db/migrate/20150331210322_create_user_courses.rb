class CreateUserCourses < ActiveRecord::Migration
  def change
    create_table :user_courses do |t|
      t.belongs_to :user, index: true
      t.belongs_to :course, index: true
      t.string :course_role

      t.timestamps null: false
    end
    add_foreign_key :user_courses, :users
    add_foreign_key :user_courses, :courses
  end
end
