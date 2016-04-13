class FixNameSubTask < ActiveRecord::Migration
  def change
    rename_column :sub_tasks, :name, :title
  end
end
