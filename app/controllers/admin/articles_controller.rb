class Admin::ArticlesController < ApplicationController
  def new
    @article = my_articles.new
  end

  def create
    @article = my_articles.new(params[:article])
    if @article.save
      flash[:notice] = "Article was created."
      redirect_to articles_path(:username => current_author.name)
    else
      flash[:notice] = "Article failed to save: #{@article.errors.full_messages}"
      render :new
    end
  end

  def edit
    @article = current_author.articles.find(params[:id])
  end

  def update
    @article = current_author.articles.find(params[:id])
    if @article.update_attributes(params[:article])
      flash[:notice] = "Article was updated."
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    article = current_author.articles.find(params[:id])
    article.destroy
    flash[:notice] = "#{article} was destroyed."
    redirect_to articles_path
  end
end
