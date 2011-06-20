class MessagesController < ApplicationController
  include MessagesHelper
  #GET /messages 
  def index
    #messages = Message.all
    #messages.each do |msg|
      #tmp = "http://twhackernews.heroku.com/messages/" + msg.id.to_s
      #msg.like_count = msg.likeCountURL(tmp)
    #  msg.like_count = msg.get_likecount(msg.id)
    #  msg.save
    #end
    #@messages = Message.all( :order => 'like_count DESC' )
    
    @messages = Message.find(:all, :conditions => 'like_count != 0', :order => 'like_count DESC')
    messages_0 = Message.find(:all, :conditions => 'like_count == 0')
    @messages << messages_0
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @messages } 
    end
  end
  
  #GET /messages/1
  #GET /messages/1.xml
  def show
    @message = Message.find(params[:id])
	@num = @message.id.to_s
	@metat = @message.title.to_s
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
          format.html { redirect_to(@message, :notice => 'News was successfully created.') }
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
    if message.user == current_user || current_user.id <= 3 # the same user or admin
      @message = message
    else
      flash[:notice] = "Must be the same user."
      redirect_to message
    end
  end
  
  #PUT /messages/1
  def update
    @message = Message.find(params[:id])
    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to(@message, :notice => 'News was successfully updated.') }
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
    message = Message.find(params[:id])
    if message.user == current_user || current_user.id <= 3
      message.destroy
    else
      flash[:notice] = "Must be the same user."
      redirect_to message
    end
    respond_to do |format|
      format.html { redirect_to(messages_url) }
      format.xml  { head :ok }
    end
  end
  
  #Get Message ID
  def getMessageID #remote function save like count when click like bt
    #puts "!!!!!!!!!!!!!!!!!!!!!!!!!fuck"
  	if params[:message_id] =~ /\/([\d].*)/ 
  	  #puts $1
  	  mid = $1
  	  msg = Message.find(mid.to_i)
  	  #tmp = "http://twhackernews.heroku.com/messages/" + mid.to_s
      #msg.like_count = msg.likeCountURL(tmp)
      msg.like_count = msg.get_likecount(mid.to_i)
      msg.save
      #puts "msg like_count =  " + msg.like_count.to_s
  	else 
  	  puts "no match"
  	end 
  end
end
