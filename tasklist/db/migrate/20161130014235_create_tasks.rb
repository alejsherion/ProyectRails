class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.datetime :create_date
      t.date :star_date
      t.date :end_date
      t.datetime :due_date
      t.string :title
      t.string :description
      t.integer :priority

      t.timestamps
    end
  end
end
