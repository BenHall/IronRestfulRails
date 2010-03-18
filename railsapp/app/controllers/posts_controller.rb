class PostController < ApplicationController
  def index
    @tasks = "test"

    respond_to do |format|
      format.html
      format.js {render :layout => false}
      format.xml { render :xml=>@tasks }
      format.json { render :json=>@tasks }
      format.atom #5
    end
  end

end
