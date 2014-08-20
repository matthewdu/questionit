class Question < ActiveRecord::Base
	#associations
	belongs_to :user
	belongs_to :answer

	validates :content, presence: true
end