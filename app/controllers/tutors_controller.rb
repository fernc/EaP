class TutorsController < ApplicationController 

	def new
		@tutor = Tutor.new
	end

	def create 
		@tutor = Tutor.new(params[:tutor])
		@tutor.request = request
		if @tutor.deliver 
			flash[:success] = 'Thank you for applying. We will get back to you soon! 😀 '
			redirect_to join_us_url
		else 
			flash.now[:danger] = 'Error sending application. Please try again.'
			render :new
		end
	end


end
