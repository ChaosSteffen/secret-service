class DocumentsController < ApplicationController
  
  
  
  # GET /documents
  # GET /documents.xml
  def index
    @subject = session[:subject]
    
    @documents = Document.find(:all, :conditions => ["classification <= :clearance", {:clearance => @subject.clearance }])
    @secret_documents = Document.find(:all, :conditions => ["classification > :clearance", {:clearance => @subject.clearance }])
    @levels = Level.find(:all)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @documents }
    end
  end

  # GET /documents/1
  # GET /documents/1.xml
  def show
    @document = Document.find(params[:id])
    @subject = session[:subject]
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @document }
    end
  end

  # GET /documents/new
  # GET /documents/new.xml
  def new
    @document = Document.new
    @subject = session[:subject]
    
    @levels = Level.find(:all, :conditions => ["id >= :id", {:id => @subject.clearance }])
    @secret_levels = Level.find(:all, :conditions => ["id < :id", {:id => @subject.clearance }])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @document }
    end
  end

  # POST /documents
  # POST /documents.xml
  def create
    @subject = session[:subject]
    
    @document = Document.new(params[:document])
    @document.subject_id = @subject.id
    
    respond_to do |format|
      if @document.save
        flash[:notice] = 'Document was successfully created.'
        format.html { redirect_to(@document) }
        format.xml  { render :xml => @document, :status => :created, :location => @document }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @document.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy_all
    @documents = Document.find(:all)
    @documents.each { |d| d.destroy }
    
    respond_to do |format|
      format.html { redirect_to(admin_url) }
      format.xml  { head :ok }
    end
    
  end

end
