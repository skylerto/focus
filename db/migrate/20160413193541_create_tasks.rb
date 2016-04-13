class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :progress
      t.integer :estimated_progress
      t.boolean :complete

      t.timestamps null: false
    end
  end
end
