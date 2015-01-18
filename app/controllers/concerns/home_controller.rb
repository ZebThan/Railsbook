class HomeController < ApplicationController

def index
	@users = User.all
	render 'users/index.html'
end
end