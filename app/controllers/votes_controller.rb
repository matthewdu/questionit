class VotesController < ApplicationController

	def vote
		if params[:type] == 'answer'
			if params[:vote] == 'like'
				current_user.likes Answer.find(params[:id])
			elsif params[:vote] == 'dislike'
				current_user.dislikes Answer.find(params[:id])
			end
		elsif params[:type] == 'question'
			if params[:vote] == 'like'
				current_user.likes Question.find(params[:id])
			elsif params[:vote] == 'dislike'
				current_user.dislikes Question.find(params[:id])
			end
		end
	end

	def unvote
		if params[:type] == 'answer'
			current_user.unvote_for Answer.find(params[:id])
		elsif params[:type] == 'question'
			current_user.unvote_for Question.find(params[:id])
		end
	end

end