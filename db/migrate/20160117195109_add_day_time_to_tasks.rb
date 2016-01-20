class AddDayTimeToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :day_time, :time
  end
end
