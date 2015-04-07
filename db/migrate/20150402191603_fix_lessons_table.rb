class FixLessonsTable < ActiveRecord::Migration
  def change
    rename_column :lessons, :user_id, :created_by_id
    remove_column :lessons, :audio_paths
  end
end
