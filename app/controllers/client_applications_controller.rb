class ClientApplicationsController < ApplicationController

  def index
    @applications = ClientApplication.all
  end

  def show
    @application = ClientApplication.find(params[:id])
  end

  def new
    @application = ClientApplication.new
    # let's make 3 attachments for now
    @application.attachments.build
    @application.attachments.build
    @application.attachments.build
  end

  def create
    @application = ClientApplication.new(params[:client_application])
    if @application.save
      @application.submit!
      @user = User.new(:email => @application.email, :password => "password", :password_confirmation => "password")
      if @user.save
        # would like to refactor here!!
        @application.update_attributes(:user_id => @user.id)
        redirect_to "/"
        flash[:notice] = "Application submitted successfully"
      end
    else
      redirect_to :back
      error_message = @application.errors.full_messages.first
      flash[:error] = "Application Failed to submit! " + " " + error_message
    end
  end

  def edit
    @application = ClientApplication.find(params[:id])
    @principal_information_form = @application.principal_information_forms.build
    @banking_information_form = @application.banking_information_forms.build
    render @application.state
  end

  def update
    @application = ClientApplication.find(params[:id])
    @application.update_attributes(params[:client_application])

    if @application.state == "submitted"
      @application.requesting!
      message = "This application has been sent in for request"
    elsif @application.state == "requested"
      @application.respond!
      message = "This application has been sent in for response"
    elsif @application.state == "responded"
      @application.complete!
      message = "This application is complete"
    elsif @application.state == "completed"
      message = "This application is really complete"
    end
    redirect_to "/"
    flash[:messasge] = message
  end

  def destroy
    @application = ClientApplication.find(params[:id])
    @application.destroy
    redirect_to :back
  end

end
