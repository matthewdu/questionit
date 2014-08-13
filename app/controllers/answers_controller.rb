class AnswersController < ApplicationController
	def new
		@answer = Answer.new
	end

	def create
		@user = current_user
		@answer = @user.answers.new(answer_params)
		if @answer.save
			flash[:success] = "Answer \'#{answer_params[:title]}\' successfully posted!"
			redirect_to @answer
		else
			render 'new'
		end
	end

	def update
	end

	def index
		@answers = Answer.paginate(page: params[:page])
	end

	def show
		@answer = Answer.find(params[:id])
	end

	def destroy
	end

	private
		def answer_params
			params.require(:answer).permit(:title, :post)
		end
end