class PicturesController < ApplicationController

before_action :load_user, only: [:create, :new]
before_action :set_picture, only: [:show]
respond_to :html

def new
	@picture = @user.pictures.new
	respond_with(@picture)
end

def create
  @user = current_user
  @picture = current_user.pictures.create(picture_params)
  @picture.save
  respond_with(@user)
end

def show
	@commentable = @picture
	@comment = Comment.new
	@comments = @picture.comments
	respond_with(@picture)
end




private

def set_picture
	@picture = Picture.find(params[:id])
end

def load_user
	resource, id = request.path.split('/')[1, 2]
	@user = current_user
	#@user = resource.singularize.classify.constantize.find(id)
end

def picture_params
  params.require(:picture).permit(:image, :user_id)
end
end
