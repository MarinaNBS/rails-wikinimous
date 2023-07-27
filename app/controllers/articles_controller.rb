class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @articles = Article.new(Article_params)
    @articles.save

    redirect_to article_path(@articles)
  end

  def edit
    @articles = Article.find(params[:id])
  end

  def update
    @articles = Article.find(params[:id])
    @articles.update(Article_params)

    redirect_to article_path(@articles)
  end

  def destroy
    @articles = Article.find(params[:id])
    @articles.destroy

    redirect_to article_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
