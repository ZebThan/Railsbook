class FriendshipController < ApplicationController

def create
	@friendship = Friendship.new(friendship_params)
	@friendship.save
end

private

def friendship_params
	params.require(:friendship).permit(:user_id, :friend_id)
end

end
