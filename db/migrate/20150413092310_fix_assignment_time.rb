class FixAssignmentTime < ActiveRecord::Migration
  def change
    remove_column :assignments, :due_time
    rename_column :assignments, :due_date, :due_at
    change_column :assignments, :due_at, :datetime
  end
end
