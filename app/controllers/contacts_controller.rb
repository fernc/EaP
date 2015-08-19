class ContactsController < ApplicationController 
	
	def new
		@contact = Contact.new 
	end

	def create 
		@contact = Contact.new(params[:contact])
		@contact.request = request
		if @contact.deliver 
			flash[:success] = 'Thank you for your message. We will get back to you soon!'
			redirect_to contact_url
		else 
			flash.now[:danger] = 'Error sending message 😔. Please try again.'
			render :new
		end
	end

end
