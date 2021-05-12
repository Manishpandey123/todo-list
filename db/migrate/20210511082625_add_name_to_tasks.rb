class AddNameToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :name, :string
    add_column :tasks, :phone, :integer
  end
end
