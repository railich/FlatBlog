class ArticlesController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy] 
  before_filter :initiate_variables, :only => [:show, :edit, :update, :destroy] 

  
  
  def index
    @articles = Article.all
    @remote_ip = request.remote_ip().to_s

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @articles }
    end
  end

  def show
    
    
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @article }
    end
  end

  def new
    @article = Article.new
    @categories = Category.all
    
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @article }
    end
  end

  def edit
    
  end

  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to(@article, :notice => 'Article was successfully created.') }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to(@article, :notice => 'Article was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(articles_url) }
      format.xml  { head :ok }
    end
  end
  
  def initiate_variables
    @article = Article.find(params[:id])
    @category = Category.find(@article.category_id)
  end
  
end

