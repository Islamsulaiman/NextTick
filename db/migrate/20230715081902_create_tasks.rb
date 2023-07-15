class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.references :project, null: false, foreign_key: true
      t.integer :status
      t.integer :time_elapsed

      t.timestamps
    end
  end
end
