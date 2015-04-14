class UpdateAssignSubmit < ActiveRecord::Migration
  def change
    remove_column :assignments, :submit_time
    rename_column :assignments, :submit_date, :submitted_at
    change_column :assignments, :submitted_at, :datetime
  end
end
