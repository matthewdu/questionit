class UsersController < ApplicationController
	before_action :signed_in_user, only: [:edit, :update, :index, :destroy]
	before_action :correct_user, only: [:edit, :update]
	before_action :admin_user, only: :destroy

	def show
		@user = User.find(params[:id])
	end

	def index
		@users = User.paginate(page: params[:page])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			sign_in @user
			flash[:success] = "Welcome to Questionit!"
			redirect_to @user
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(settings_params)
			flash[:success] = "Profile Updated!"
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		user = User.find(params[:id]).destroy
		flash[:success] = "#{user.id} #{user.name} deleted with username: #{user.username}"
		redirect_to users_url
	end

	private

		def user_params
			params.require(:user).permit(:username, :name, :password, :password_confirmation)
		end

		def settings_params
			params.require(:user).permit(:name, :password, :password_confirmation)
		end
end
