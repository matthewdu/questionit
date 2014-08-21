class QuestionsController < ApplicationController
	def new
		@question = Question.new
	end

	def create
		@answer = Answer.find(params[:answer_id])
		question = @answer.questions.new(question_params)
	end

	private
		def question_params
			params[:user_id] = current_user.id
			params.require(:question).permit(:content, :user_id)
		end

end