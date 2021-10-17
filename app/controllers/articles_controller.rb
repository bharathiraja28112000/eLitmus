class ArticlesController < ApplicationController

  # http_basic_authenticate_with name: "hi", password: "hi", except: [:index, :show]

  def index
    @articles = Article.all
    # @articles = Article.where(userid: 1)
  end
  def myindex
    # @articles = Article.all
    @articles = Article.where(userid: session[:user_id])
  end

  def show
    @article = Article.find(params[:id])
    # @article = Article.find_by(userid: params[:userid])
    # @article = Article.where(userid: params[:user_id])
    # @article = Article.where( userid: 2 )
  end
  def myshow
    @article = Article.find(params[:id])
    # @article = Article.find_by(userid: params[:userid])
    # @article = Article.where(userid: params[:user_id])
    # @article = Article.where( userid: 2 )
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

    private
    def article_params
      params.require(:article).permit(:title, :body, :status).merge({userid: session[:user_id]})
    end
    
end
