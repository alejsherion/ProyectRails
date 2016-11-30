class CreateNotebooks < ActiveRecord::Migration[5.0]
  def change
    create_table :notebooks do |t|
      t.string :subject
      t.integer :user_id
      t.datetime :create_date

      t.timestamps
    end
  end
end
