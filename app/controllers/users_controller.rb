class UsersController < ApplicationController
  #ログイン認証されていなければ、ログイン画面へリダイレクトする
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def correct_user
      @user = User.find(params[:id])
      redirect_to user_path(current_user) unless @user == current_user
  end

  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  	#@user_book = Book.where(@user)でもいける
  end

  def index
  	@user = User.find(current_user[:id])
  	@book = Book.new
  	@users = User.all
  end

  def edit
  	@user = User.find(current_user[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
  	 redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
