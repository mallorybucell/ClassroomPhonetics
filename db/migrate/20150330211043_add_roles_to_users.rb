class AddRolesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin,    :boolean, default: false
    add_column :users, :teacher,  :boolean
    add_column :users, :student,  :boolean
  end
end
