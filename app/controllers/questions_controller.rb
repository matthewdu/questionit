class QuestionsController < ApplicationController
	before_action :signed_in_user, only: [:create, :edit, :update, :destroy]

	def create
		@answer = Answer.find(params[:answer_id])
		@question = @answer.questions.new(question_params)
		@question.user_id = current_user.id
		if @question.save
			flash[:success] = "Question Saved"
			redirect_to @answer
		else
			render 'answers/show'
		end
	end

	def edit
		@question = Question.find(params[:id])
	end

	def update
		question = Question.find(params[:id])
		render :edit unless current_user.admin? || current_user?(@question.user)
		if question.update_attributes(question_params)
			flash[:success] = 'Question updated!'
			redirect_to question.answer
		else
			render :edit
		end
	end

	def destroy
		question = Question.find(params[:id])
		if current_user.admin? || current_user?(@question.user)
			question.destroy
			flash[:success] = 'Question destroyed!'
			redirect_to question.answer
		else
			flash[:danger] = 'No permission to delete'
			redirect_to question.answer
		end
	end

	private
		def question_params
			params.require(:question).permit(:content)
		end

end