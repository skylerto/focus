class AddDefaultsToTask < ActiveRecord::Migration
  def change
    change_column :tasks, :progress, :integer, default: 0
    change_column :tasks, :estimated_progress, :integer, default: 0
    change_column :tasks, :complete, :boolean, default: false
  end
end
