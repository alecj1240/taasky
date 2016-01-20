class ChangeDuedateToDate < ActiveRecord::Migration
  def change
    change_column(:tasks, :duedate, :date)
  end
end
