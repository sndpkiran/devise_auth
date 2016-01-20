class DemoMailer < ApplicationMailer
	def confirmation_mail(user)
		@user = user
		@url = "http://localhost:3000/profile"
		mail(to: @user.email, subject: 'Test Mail')
	end
end
