class HomeController < ApplicationController
  # before_action :isLoggedIn?
  def index

  end

  def send_mail
  	@user = User.find(1)
  	DemoMailer.confirmation_mail(@user).deliver_now
  	render 'index'
  end
end
