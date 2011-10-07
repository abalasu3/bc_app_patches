class VoterepliesController < ApplicationController
  # GET /votereplies
  # GET /votereplies.xml
  def index
    @votereplies = Votereply.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @votereplies }
    end
  end

  # GET /votereplies/1
  # GET /votereplies/1.xml
  def show
    @votereply = Votereply.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @votereply }
    end
  end

  # GET /votereplies/new
  # GET /votereplies/new.xml
  def new
    @votereply = Votereply.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @votereply }
    end
  end

  # GET /votereplies/1/edit
  def edit
    @votereply = Votereply.find(params[:id])
  end

  # POST /votereplies
  # POST /votereplies.xml
  def create
     #@votereply = current_user.votereplies.build(params[:reply_id])
    @votereply = Votereply.find(params[:reply_id])
    if (!@votereply)
      @votereply = current_user.votereplies.build(params[:votereply])
    end
    @votereply.rcount = @votereply.rcount + 1
    @votereply.update_attributes(params[:rcount])

    respond_to do |format|
      if @votereply.save
        format.html { redirect_to(@votereply, :notice => 'Votereply was successfully created.') }
        format.xml  { render :xml => @votereply, :status => :created, :location => @votereply }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @votereply.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /votereplies/1
  # PUT /votereplies/1.xml
  def update
    @votereply = Votereply.find(params[:id])

    respond_to do |format|
      if @votereply.update_attributes(params[:votereply])
        format.html { redirect_to(@votereply, :notice => 'Votereply was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @votereply.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /votereplies/1
  # DELETE /votereplies/1.xml
  def destroy
    @votereply = Votereply.find(params[:id])
    @votereply.destroy

    respond_to do |format|
      format.html { redirect_to(votereplies_url) }
      format.xml  { head :ok }
    end
  end
end
