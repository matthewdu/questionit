class Question < ActiveRecord::Base
	acts_as_votable #voting

	#associations
	belongs_to :user
	belongs_to :answer

	validates :content, presence: true
end