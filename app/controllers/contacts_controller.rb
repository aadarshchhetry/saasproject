class ContactsController < ApplicationController
	def new
	  @contact = Contact.new
	end
	def create
	  @contact = Contact.new(contact_params)
	  if @contact.save
	     flash[:success] = "Sent succesfully"
	     redirect_to new_contacts_path
      else
	  	 flash[:error] = @contact.errors.full_messages.join(" \n, ")
	     redirect_to new_contacts_path
	  end
	end
	private
	  def contact_params
	     params.require(:contact).permit(:name, :email, :comments)
	  end
end
