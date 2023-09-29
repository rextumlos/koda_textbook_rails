class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    # Getting all posts, /posts

    @posts = Post.includes(:categories).all
    @categories = Category.all

    category_names =  params.select { |k, v| v == "1"}.keys

    if params[:sort].present?
      if params[:sort] == 'title'
        sort = { params[:sort].parameterize.to_sym => :asc }
      else
        sort = { params[:sort].parameterize.to_sym => :desc }
      end
      @posts = @posts.order(sort)
    end

    @posts = @posts.where(categories: { name: category_names}) if category_names.any?

    if params[:filter].present?
      @posts = @posts.where(published: true)
    end
    # start_date = '2023-09-01'
    # end_date = '2023-09-29'
    # @posts = Post.all.order(created_at: :desc)
    #                   .where(created_at: start_date..end_date)

    # @posts = Post.all
  end

  def new
    # Initiating to create a new post, /posts/new
    @post = Post.new
  end

  # Creating a new post
  def create
    @post = Post.new(post_params)

    p @post

    if @post.save
      flash[:notice] = 'Post created successfully'
      redirect_to posts_path
    else
      flash.now[:alert] = 'Post create failed'
      render :new, status: :unprocessable_entity
    end
  end

  # Getting post by id
  def show; end

  # Initiate editing a post, /post/:id/edit
  def edit; end

  # Updating a post
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = 'Post updated successfully'
      redirect_to posts_path
    else
      flash.now[:alert] = 'Post update failed'
      render :edit, status: :unprocessable_entity
    end
  end

  # Deleting a post
  def destroy
    @post.destroy
    flash[:notice] = 'Post destroyed successfully'
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :published, category_ids: [])
  end
end