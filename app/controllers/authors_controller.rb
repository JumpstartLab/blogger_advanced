class AuthorsController < ApplicationController

  before_filter :require_login

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def edit
    @author = Author.find(params[:id])
  end

  def create
    @author = Author.new(params[:author])
    @author.password = params[:author][:password]
    @author.password_confirmation = params[:author][:password_confirmation]

    if @author.save
      redirect_to @author, notice: 'Author was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @author = Author.find(params[:id])
    @author.password = params[:author][:password]
    @author.password_confirmation = params[:author][:password_confirmation]

    if @author.update_attributes(params[:author])
      redirect_to @author, notice: 'Author was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy

    redirect_to authors_url
  end
end
