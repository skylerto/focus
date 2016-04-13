class CreateSubTasks < ActiveRecord::Migration
  def change
    create_table :sub_tasks do |t|

      t.belongs_to :task, index: true
      t.string :name
      t.integer :progress, default: 0
      t.integer :estimated_progress
      t.boolean :completed, default: false

      t.timestamps null: false
    end
  end
end
