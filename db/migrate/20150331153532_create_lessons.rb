class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t| 
      t.belongs_to  :user
      t.belongs_to  :course
      t.text        :audio_paths

      t.timestamps null: false
    end
  end
end
