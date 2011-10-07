class PostsController < ApplicationController
   # GET /posts
  # GET /posts.xml
  def index
    @posts = Post.search(params[:search])
    #@posts = Post.all

    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.xml  { render :xml => @posts }
    #end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end


  def VotePost.create
      @vote_post = current_user.vote_post.build(params[:id])
       respond_to do |format|

      if @vote_post.save
        format.html { redirect_to(@vote_post, :notice => 'Vote post was successfully created.') }
        format.xml  { render :xml => @vote_post, :status => :created, :location => @vote_post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @vote_post.errors, :status => :unprocessable_entity }
      end
    end
   end



  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])

    if (current_user.id == @post.user_id)
      flash[:error] = "You cannot vote your own post"
    else
      @post.count = @post.count + 1
      if @post.most_active.nil?
        @post.most_active = (0.8 * @post.count) + (0.2 * @post.updated_at)
      else
        @post.most_active = (0.8 * @post.count) + (0.2 * @post.most_active)
      end
      @post.update_attributes(params[:count])
    end
#    redirect_to :controller => VotePost, :action => show, :id => @post
    redirect_to posts_path
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post  = current_user.posts.build(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
end
