class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User"

  scope :requests, ->(id) { where('friend_id=?', id) } 
end
