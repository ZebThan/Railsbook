class HomeController < ApplicationController

def index
	@users = User.all
	render 'users/index'
end


end