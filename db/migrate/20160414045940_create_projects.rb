class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string  :name
      t.string  :description
      t.string  :status
      t.belongs_to :owner, index: true
      t.belongs_to :category, index: true
    end
  end
end