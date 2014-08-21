class QuestionsController < ApplicationController
	def new
		@answer = Answer.find(params[:answer_id])
		@question = Question.new
	end

	def create
		@answer = Answer.find(params[:answer_id])
		@question = @answer.questions.new(question_params)
		if @question.save
			flash[:success] = "Question Saved"
			redirect_to @answer
		else
			render 'new'
		end
	end

	private
		def question_params
			params[:user_id] = current_user.id
			params.require(:question).permit(:content, :user_id)
		end

end