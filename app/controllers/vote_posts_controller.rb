class VotePostsController < ApplicationController
  # GET /vote_posts
  # GET /vote_posts.xml
  def index
    @vote_posts = VotePost.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vote_posts }
    end
  end

  # GET /vote_posts/1
  # GET /vote_posts/1.xml
  def show
    @vote_post = VotePost.find(params[:id])

   # respond_to do |format|
    #  format.html # show.html.erb
     # format.xml  { render :xml => @vote_post }

  end

  # GET /vote_posts/new
  # GET /vote_posts/new.xml
  def new
    @vote_post = VotePost.new
     respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vote_post }
    end
  end

  # GET /vote_posts/1/edit
  def edit
    @vote_post = VotePost.find(params[:post_id])
    if (current_user.id == @vote_post.user_id)
    else

    @vote_post.count = @vote_post.count + 1
    @vote_post.update_attributes(params[:count])
    end
    redirect_to posts_path
  end

  # POST /vote_posts
  # POST /vote_posts.xml
  def create
    @vote_post = current_user.vote_post.build(params[:id])
    @vote_post.count = @vote_post.count+1
    @vote_post.update_attributes(params[:count])
    @vote_post.save

    #respond_to do |format|

      #if @vote_post.save
        #format.html { #redirect_to(@vote_post, :notice => 'Vote post was successfully created.') }
       # format.xml  { #render :xml => @vote_post, :status => :created, :location => @vote_post }
      #else
     #   format.html { #render :action => "new" }
      #  format.xml  { #render :xml => @vote_post.errors, :status => :unprocessable_entity }
     # end
  end




  # PUT /vote_posts/1
  # PUT /vote_posts/1.xml
  def update
    @vote_post = VotePost.find(params[:id])

    respond_to do |format|
      if @vote_post.update_attributes(params[:vote_post])
        format.html { redirect_to(@vote_post, :notice => 'Vote post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vote_post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /vote_posts/1
  # DELETE /vote_posts/1.xml
  def destroy
    @vote_post = VotePost.find(params[:id])
    @vote_post.destroy

    respond_to do |format|
      format.html { redirect_to(vote_posts_url) }
      format.xml  { head :ok }
    end
  end
end
