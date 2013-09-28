class ContactsController < ApplicationController

  def create
    @client = Client.find(params[:client_id])
    @contact = @client.contacts.create(params[:contact].permit(:nom, :prenom, :telephonefixe,:telephoneportable))
    redirect_to client_path(@client)
  end

  def show
  @client = Client.find(params[:client_id])
  @contact=@client.contacts.find(params[:id])
  end

  def edit
  @client = Client.find(params[:client_id])
  @contact=@client.contacts.find(params[:id])
  end


  def update
  @client = Client.find(params[:client_id])
   @contact=@client.contacts.find(params[:id])
    if @contact.update(params[:contact].permit(:nom, :prenom, :adresse, :datenaissance, :type, :telephonefixe, :telephoneportable, :numerosecu))
      redirect_to client_path(@client)
    else
      render 'edit'
    end
  end






  def destroy
    @client = Client.find(params[:client_id])
    @contact = Contact.find(params[:id]) 
    @contact.destroy
	flash[:notice] = "Le contact à été supprimé de la base de données!" 
 	#flash.keep
    redirect_to client_path(@client)
  end



end
