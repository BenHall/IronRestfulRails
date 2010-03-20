require 'mscorlib'
require 'System'
require 'NHib.DataAccess.dll'
include NHib::DataAccess

class PostsController < ApplicationController
  # GET /posts
  def index
   r = PostRepository.new
   @posts = r.get_all_posts

   respond_to do |format|
      format.html # show.html.erb
      format.xml 
      format.json { render :json => @posts }
    end
  end

  # GET /posts/1
  # Shows a single post
  def show
    r = PostRepository.new
    @post = r.GetPost("PostID", params[:id].to_i)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end    
  end

  # GET posts/new
  # Create a new post form should be displayed
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # POST posts/create
  # Form post to this end-point to create the post itself
  def create
    @post = Post.new
    @post.PostID = params[:id].to_i
    @post.title = params[:title]

    r = PostRepository.new

    respond_to do |format|
      if r.save(@post)
        flash[:notice] = 'Post was successfully created.'
        format.html { redirect_to(@post) }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # GET posts/1/edit
  # Edit an existing post
  def edit
    r = PostRepository.new
    @post = r.GetPost("PostID", params[:id].to_i)
  end

  # PUT posts/1
  # Updates an existing post, used from the /edit end-point
  def update
    r = PostRepository.new
    @post = r.GetPost("PostID", params[:id])
    @post.PostID = params[:id].to_i
    @post.title = params[:title]

    respond_to do |format|
      if r.save(@post)
        flash[:notice] = 'Post was successfully created.'
        format.html { redirect_to(@post) }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE posts/1
  # Deletes an existing post
  def destroy
    r = PostRepository.new
    @post = r.GetPost("PostID", params[:id].to_i)
    r.delete @post

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end

end
