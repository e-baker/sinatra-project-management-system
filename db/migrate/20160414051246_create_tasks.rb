class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string  :name
      t.datetime  :due_date
      t.integer :project_id
      t.integer :category_id
    end
  end
end