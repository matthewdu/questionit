class AnswersController < ApplicationController
	before_action :signed_in_user, only: [:new, :create, :edit, :update, :destroy]

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
		render 'edit' unless current_user.admin? || current_user?(@answer.user)
		if @answer.update_attributes(answer_params)
			flash[:success] = "\'#{@answer.title}\' successfully updated!"
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
		answer = Answer.find(params[:id])
		if current_user.admin? || current_user?(answer.user)
			answer.destroy
			flash[:success] = "\'#{answer.title}\' was successfully deleted."
			redirect_to answer.user
		else
			flash[:danger] = 'No permission to delete'
			redirect_to answers_path
		end
	end

	private
		def answer_params
			params.require(:answer).permit(:title, :content)
		end
end