require 'mscorlib'
require 'System'
require 'NHib.DataAccess.dll'
require 'Newtonsoft.Json'
PostRepository = NHib::DataAccess::PostRepository

class System::Object
  def to_json(encoding)
    Newtonsoft::Json::JsonConvert.SerializeObject(self)
  end
end

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
    
  end

  # GET posts/new
  # Create a new post form should be displayed
  def new

  end

  # POST posts/create
  # Form post to this end-point to create the post itself
  def create

  end

  # GET posts/1/edit
  # Edit an existing post
  def edit

  end

  # PUT posts/1
  # Updates an existing post, used from the /edit end-point
  def update

  end

  # DELETE posts/1
  # Deletes an existing post
  def destroy

  end

end
