class Answer < ActiveRecord::Base
	acts_as_votable #voting
	
	#associations
	belongs_to :user
	has_many :questions

	before_save { self.points = 1 }

	validates :title, presence: true, length: { maximum: 255 }
	validates :content, presence: true

end