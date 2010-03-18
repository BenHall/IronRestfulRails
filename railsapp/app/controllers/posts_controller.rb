require 'mscorlib'
require 'System'
require 'NHib.DataAccess.dll'
PostRepository = NHib::DataAccess::PostRepository


class PostsController < ApplicationController
  def index
   r = PostRepository.new
   @posts = r.get_all_posts

   respond_to do |format|
      format.html # show.html.erb
      format.xml 
      format.json { render :json => @posts }
    end
  end

end
