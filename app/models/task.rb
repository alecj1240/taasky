class Task < ActiveRecord::Base
	belongs_to :user

  # validates name, time, duedate, importance - that the presence is their
	validates :name, :time, :duedate, :importance, presence: true
  # validates that time - its only an integer
	validates :time, numericality: { only_integer: true }
  # validates that the name is at least 2 characters
  validates :name, length: { minimum: 2 }
end
