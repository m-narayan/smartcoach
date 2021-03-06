class BlogsController < ApplicationController
  def index
    @blogs = Blog.search(params[:search])
    @tags = Tag.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(params[:blog])
    if @blog.save
      flash[:success] = "Blog added successfully!!!!"
      # NewsletterMailer.weekly("ankithbti007@gmail.com", flash[:success]).deliver
      redirect_to @blog

    else
      render :action => 'new'
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update_attributes(params[:blog])
      flash[:success] = "Blog updated successfully!!!!"
      # NewsletterMailer.weekly("ankithbti007@gmail.com", flash[:success]).deliver
      redirect_to @blog
    else
      render :action => 'edit'
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    flash[:success] = "Successfully destroyed blog."
    redirect_to blogs_url
  end
end
