class UpdateResponsesColumn < ActiveRecord::Migration
  def change
    add_column :responses, :feedback_submitted_at, :datetime
  end
end
