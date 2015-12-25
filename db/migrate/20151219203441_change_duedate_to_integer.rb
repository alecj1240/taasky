class ChangeDuedateToInteger < ActiveRecord::Migration
  def change
  	change_column(:tasks, :duedate, :integer)
  end
end
