class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :pictures
  has_many :comments, :as => :commentable


  has_many :friendships
 #has_many :friendships, :foreign_key => "friend_id"
  has_many :friends, :class_name => "User", :through => :friendships
 #has_many :users, :foreign_key => "friend_id", :through => :friendships


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "images/:style/missing.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


validates :name, :length => {:in => 3..30}
validates :age, :numericality => { :only_integer => true, :less_than => 100 } 
end