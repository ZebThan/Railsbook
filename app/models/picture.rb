class Picture < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :as => :commentable 
  has_attached_file :image, :styles => {:medium => "300x300>", :thumb => "100x100>", :show => "1000x1000>"}, :default_url => "/images/:styles/missing.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end