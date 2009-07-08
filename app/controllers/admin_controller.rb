class AdminController < ApplicationController
  def index
    @levels = Level.find(:all)
    @subjects = Subject.find(:all)
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end
end
