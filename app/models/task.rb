class Task < ActiveRecord::Base
	belongs_to :user

	validates :name, :time, presence: true
	validates :time, numericality: { only_integer: true }
end
