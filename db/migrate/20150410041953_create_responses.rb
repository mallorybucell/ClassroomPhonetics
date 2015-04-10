class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.belongs_to  :assignment, index: true
      t.belongs_to  :exercise, index: true
      t.text        :feedback
      t.integer     :feedbacker_id #TODO belongs to user as feedbacker?

      t.timestamps null: false
    end
    add_foreign_key :responses, :assignments
    add_foreign_key :responses, :exercises
  end
end
