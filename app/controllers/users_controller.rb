class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :add_comment]

  respond_to :html

  def index
    @users = User.all
    respond_with(@users)
  end

  def show


    if user_signed_in? do
    render 'home/warning'
     end
    end

    @pictures = @user.pictures.all
    @commentable = @user
    @comments = @user.comments
    @comment = Comment.new
    respond_with(@user)
  end

  def new
    @user = User.new
    respond_with(@user)
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user.save
    respond_with(@user)
  end

  def update
    @user.update(user_params)
    respond_with(@user)
  end

  def destroy
    @user.destroy
    respond_with(@user)
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :about, :age, :sex, :progress, :avatar)
    end

    def comment_params
    params.require(:comment).permit(:content, :commentable_id, :commentable_type)
    end
end
