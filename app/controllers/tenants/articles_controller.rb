class Tenants::ArticlesController < ApplicationController
  before_action :require_author, except: [:show, :index]

  def show
    @tenant  = Tenant.find_by(slug: params[:slug])
    @article = @tenant.articles.find(params[:id])
  end

  def index
    @tenant         = Tenant.find_by(slug: params[:slug])
    @articles, @tag = @tenant.articles.search_by_tag_name(params[:tag], @tenant)
  end

  def new
    @article = current_author.articles.new
  end

  def create
    @article = current_author.articles.new(article_params)
    if @article.save
      flash[:notice] = "Article was created."
      redirect_to tenant_articles_path(current_tenant.slug)
    else
      render :new
    end
  end

  def edit
    @article = current_author.articles.find params[:id]
  end

  def update
    @article = current_author.articles.find params[:id]
    if @article.update_attributes(article_params)
      flash[:notice] = "Article was updated."
      redirect_to tenant_article_path(current_tenant.slug, @article)
    else
      render :edit
    end
  end

  def destroy
    article = current_author.find params[:id]
    article.destroy
    flash[:notice] = "#{article} was destroyed."
    redirect_to tenant_articles_path(current_tenant.slug)
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :author_id, :tag_list)
  end
end
