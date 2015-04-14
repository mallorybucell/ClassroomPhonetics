class RemoveResponseColAssign < ActiveRecord::Migration
  def change
    remove_column :assignments, :response
    add_column :responses, :content, :string
  end
end
