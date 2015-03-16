class FriendsController < ApplicationController

before_action :set_user, only: [:index]


	def index
		@users = @user.friends.all # @users = @friends
		render 'users/index'
	end

	def create
		@friendship = Friendship.new(friendship_params)
		@friendship.save
	end

private

    def set_user
      resource, id = request.path.split('/')[1, 2]
      @user = resource.singularize.classify.constantize.find(id)
      #@user = User.find(params[:id])
    end

	def friendship_params
	params.require(:friendship).permit(:user_id, :friend_id)
	end

end
