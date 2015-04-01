class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.belongs_to  :user, index: true
      t.date        :due_date
      t.string      :due_time
      t.date        :submit_date
      t.time        :submit_time
      t.integer     :assigned_by

      t.timestamps null: false
    end
    add_foreign_key :assignments, :users
  end
end
