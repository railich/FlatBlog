class RatingsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
        @rating = @article.ratings.new(params[:rating])
        @rating.article_id = params[:article]
        @rating.user_identity = @article.title+request.remote_ip()
        @rating.value = params[:value]

          if @rating.save
            respond_to do |format|
            format.html {redirect_to(articles_url, :notice => 'Your rating received')}
            format.xml {render :xml => @article, :status => :created, :location => @article}
          end
        end
  end

end