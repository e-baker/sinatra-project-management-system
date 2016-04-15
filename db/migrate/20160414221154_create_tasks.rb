class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string   :description
      t.integer  :user_id
      t.integer  :project_id
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
