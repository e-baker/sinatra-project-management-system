class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string  :name
      t.datetime  :due_date
      t.belongs_to :project
      t.belongs_to :category
    end
  end
end