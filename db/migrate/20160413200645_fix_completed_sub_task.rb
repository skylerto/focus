class FixCompletedSubTask < ActiveRecord::Migration
  def change
    rename_column :sub_tasks, :completed, :complete
  end
end
