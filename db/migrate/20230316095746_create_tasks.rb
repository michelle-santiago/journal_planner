class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.datetime :deadline
      t.integer :category_id

      t.timestamps
    end
  end
end
