class CommentsController < ApplicationController

before_action :load_commentable

respond_to :html

def new
   @comment = @commentable.comments.new
end


def create
  @comment = @commentable.comments.new(comment_params)
  @comment.save
  redirect_to @commentable
  #respond_with(@commentable)
end

def show
	respond_with(@comment)
end

  def destroy
    @comment.destroy
    respond_with(@comment)
  end

private

	def load_commentable
    	resource, id = request.path.split('/')[1, 2]
    	@commentable = resource.singularize.classify.constantize.find(id)
  	end

def comment_params
  params.require(:comment).permit(:content, :commentable_id, :commentable_type)
end
end
