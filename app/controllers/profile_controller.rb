class ProfileController < ApplicationController
  before_action :isLoggedIn?
  def index
  	@current_user_details = UserDetail.find_by_user_id(current_user.id)
  	
  end

  # def show
  # end

  def edit
  	@current_user_details = UserDetail.find_by_user_id(current_user.id)

  end

  def updateUserDetails
  	@update_user = UserDetail.find_by_user_id(current_user.id)
  	if @update_user.update_attributes(params[:user_details].permit(:fname, :lname, :dob, :gender))
  		redirect_to :action => :index
  	else 
  		flash[:alert] = "Failed to update the details."
  		render('edit')
  	end
  end

  def update
  	params[:user][:user_id] = current_user.id
  	@user_details = UserDetail.new(params[:user].permit(:user_id, :fname, :lname, :dob, :gender))
  	if @user_details.save
  		redirect_to controller: :profile, action: :index
  	else
  		flash[:alert] = "Failed to update users details. Please check the details you have entered."
  		render('index')
  	end
  end
end
