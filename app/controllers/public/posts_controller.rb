class PostsController < ApplicationController
  def new
    @post=Post.new
  end
  
  def create
    @post=Post
  end

  def index
    @posts=Post.all
  end

  def show
  end

  def edit
  end
end
