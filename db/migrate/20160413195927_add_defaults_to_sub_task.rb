class AddDefaultsToSubTask < ActiveRecord::Migration
  def change
    change_column :sub_tasks, :estimated_progress, :integer, default: 0
  end
end
