class ArticlesController < ApplicationController
  def index
    if user_signed_in?
      @articles=Article.all
    else
      redirect_to new_user_session_path
    end
  end
  def show
    # byebug
    if user_signed_in?
      @article = Article.find(params[:id])
      @authors = @article.authors
    else
      redirect_to new_user_session_path
    end
    # render json: @article
  end
  def new
    if user_signed_in?
      @article = Article.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    # byebug
    if user_signed_in?
      @article = Article.new(article_params)
      if @article.save
        if article_params2[:name] != ""
          if Author.find_by(name: article_params2[:name])
            @article.authors<<Author.find_by(name: article_params2[:name])
          else
            @article.authors.create(article_params2)
          end
        end
        redirect_to show_post_path(@article.id)
      else
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to new_user_session_path
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
      if article_params2[:name] != ""
        if Author.find_by(name: article_params2[:name])
          if @article.authors.find_by(name: article_params2[:name]) == false
            @article.authors<<Author.find_by(name: article_params2[:name])
          end
        else
          @article.authors.create(article_params2)
        end
      end
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
