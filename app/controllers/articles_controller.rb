class ArticlesController < ApplicationController
  def index
    @articles=Article.all
  end
  def show
    # byebug
    @article = Article.find(params[:id])
    @authors = @article.authors
    # render json: @article
  end
  def new
    @article = Article.new
  end

  def create
    byebug
    @article = Article.new(article_params)
    if @article.save
      @article.authors.create(article_params2)
      redirect_to show_post_path(@article.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    # byebug
    @article = Article.find(params[:id])
    # render json: @article
    if @article.update(article_params)
      redirect_to show_post_path(@article.id)
    else
      # render :edit, status: :unprocessable_entity
      render json: article
    end
  end

  def delete
    # byebug
    @article=Article.find(params[:id])
    @article.destroy
    redirect_to root_path, status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
    def article_params2
      params.require(:article).permit(:name)
    end
end
