class ContactsController < ApplicationController
	# GET request for the contact form '/contact-us'
	def new
	# Instance variable to create a form field
	  @contact = Contact.new
	end
	# POST request by the http
	# It request for the '/contacts'
	def create
	# Assignments for the params 
	  @contact = Contact.new(contact_params)
	# Saves the enter data from "form field" to the database 
	  if @contact.save
	# Variable to store params
	  	name = params[:contact][:name]
	  	email = params[:contact][:email]
	  	body = params[:contact][:comments]
	# Pre defined function to deliver the mail to the user-email 
	  	ContactMailer.contact_email(name, email, body).deliver
	# If succesfully saved then flash hash the message 
	     flash[:success] = "Sent succesfully"
	# Redirects to the new_contact_path
	     redirect_to new_contact_path
      else
    # If fail to save then flash hash the message  
	  	 flash[:danger] = @contact.errors.full_messages.join(", ")
	# Redirect to the '/contact-us'
	     redirect_to new_contact_path
	  end
	  
	end
	# Private variables for security purpose
	private
	  def contact_params
	     params.require(:contact).permit(:name, :email, :comments)
	  end
end
