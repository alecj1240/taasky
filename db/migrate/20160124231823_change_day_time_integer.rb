class ChangeDayTimeInteger < ActiveRecord::Migration
  def change
    change_column(:tasks, :day_time, :integer)
  end
end
