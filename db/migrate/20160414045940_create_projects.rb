class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string  :name
      t.string  :description
      t.string  :status
      t.integer :user_id
      t.integer :category_id
    end
  end
end