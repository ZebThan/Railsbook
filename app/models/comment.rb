class Comment < ActiveRecord::Base
belongs_to :commentable, :polymorphic => true
has_one :author, :class_name => "User"

end
