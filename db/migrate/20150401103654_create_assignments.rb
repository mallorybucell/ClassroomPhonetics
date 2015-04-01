class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.belongs_to  :user, index: true
      t.belongs_to  :lesson, index: true
      t.text        :response
      t.date        :due_date
      t.time        :due_time
      t.date        :submit_date
      t.time        :submit_time
      t.integer     :assigned_by

      t.timestamps null: false
    end
    add_foreign_key :assignments, :users
    add_foreign_key :assignments, :lessons
  end
end

