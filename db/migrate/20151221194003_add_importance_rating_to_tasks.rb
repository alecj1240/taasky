class AddImportanceRatingToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :importance, :string
  end
end
