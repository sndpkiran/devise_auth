class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

	def configure_permitted_parameters
	  	devise_parameter_sanitizer.for(:sign_up) << :name
	  	devise_parameter_sanitizer.for(:account_update) << :name
	end

  	def isLoggedIn?
  		if user_signed_in?
  			# redirect_to :controller => :profile, :action => :index
  			return true
  		else
  			flash[:alert] = "Please sign in to view your profile."
  			redirect_to new_user_session_path
  			return false
  		end
  end
end
