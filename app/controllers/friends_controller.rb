class FriendsController < ApplicationController

before_action :set_user, only: [:index, :new]
respond_to :html, :js
	def index
		@friendship_ids = Friendship.where(friend_id: @user.id).pluck(:user_id)
		@users = @user.friends.where(id: @friendship_ids) # @users = @friends
		render 'users/index'
	end

	def new
		if ( !current_user.friends.exists?(@user.id) && (current_user != @user))  # protects from adding already befriended users and self
			@friendship = Friendship.new(user_id: current_user.id, friend_id: @user.id)
			@friendship.save
		end
		respond_with(@user)
	end

private

    def set_user
      resource, id = request.path.split('/')[1, 2]
      @user = resource.singularize.classify.constantize.find(id)
    end

end
