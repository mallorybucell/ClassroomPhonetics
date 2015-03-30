class AddResponsetoAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :responses, :text
  end
end
