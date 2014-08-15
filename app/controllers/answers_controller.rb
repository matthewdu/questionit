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

	def edit
		@answer = Answer.find(params[:id])
	end

	def update
		@answer = Answer.find(params[:id])
		if @answer.update_attributes(edit_params)
			flash[:success] = "\'#{answer.title}\' successfully updated!"
			redirect_to @answer
		else
			render 'edit'
		end
	end

	def index
		@answers = Answer.paginate(page: params[:page])
	end

	def show
		@answer = Answer.find(params[:id])
	end

	def destroy
		answer = Answer.find(params[:id]).destroy
		flash[:success] = "\'#{answer.title}\' was successfully deleted."
		redirect_to answer.user
	end

	private
		def answer_params
			params.require(:answer).permit(:title, :post)
		end

		def edit_params
			params.require(:answer).permit(:title, :post)
		end
end