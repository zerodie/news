class MessagesController < ApplicationController
  
  #GET /messages
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @messages = @user.messages
    else
      @messages = Message.all
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @messages } 
    end
  end
  
  #GET /messages/1
  #GET /messages/1.xml
  def show
    @message = Message.find(params[:id])
    respond_to do |format|
       format.html # show.html.erb
       format.xml  { render :xml => @message }
    end
  end
  
  #GET /messages/new
  def new
    
  
    unless user_signed_in?
      redirect_to new_user_session_path
    else
      @message = Message.new
      @message.title = params[:t]
  	  @message.url = params[:u]
	  @message.content = params[:s]
    end
  end
  
  #POST /messages
  def create
    unless user_signed_in?
      redirect_to new_user_session_path
    else
      @message = current_user.messages.new(params[:message])
      respond_to do |format|
        if @message.save
          format.html { redirect_to(@message, :notice => 'Message was successfully created.') }
          format.xml  { render :xml => @message, :status => :created, :location => @message }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
        end
      end
    end
  end
  
  #GET /messages/1/edit
  def edit
    message = Message.find(params[:id])
    if message.user == current_user
      @message = message
    else
      flash[:notice] = "Must be same user."
      redirect_to message
    end
  end
  
  #PUT /messages/1
  def update
    @message = Message.find(params[:id])
    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to(@message, :notice => 'message was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  #DELETE /messages/1
  #DELETE /messages/1.xml
  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    respond_to do |format|
      format.html { redirect_to(messages_url) }
      format.xml  { head :ok }
    end
  end
end
