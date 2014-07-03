class ContactsController < ApplicationController

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      # UserMailer.contact_form(@contact.name, @contact.email, @contact.message).deliver
      redirect_to root_path, notice: "Your message has been sent. Thank You"
    else
      render action: 'new'
    end
  end

  private

  def contact_params
    params.require(:contact_form).permit(:name, :email, :message)
  end
end
