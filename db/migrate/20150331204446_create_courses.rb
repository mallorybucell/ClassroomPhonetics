class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string    :course_name
      t.integer   :course_id
      t.string    :semester
      t.string    :year
      t.string    :instructor_ids

      t.timestamps null: false
    end
  end
end
