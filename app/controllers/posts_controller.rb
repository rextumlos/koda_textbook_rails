class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :check_auth_user, only: [:edit, :update, :destroy]

  def index
    @posts = Post.includes(:categories, :user, :region, :province, :city, :barangay).all
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

    @posts = @posts.page(params[:page]).per(10)

    # render json: @posts, each_serializer: PostSerializer
  end

  def new
    # Initiating to create a new post, /posts/new
    @post = Post.new
  end

  # Creating a new post
  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      flash[:notice] = 'Post created successfully'
      redirect_to posts_path
    else
      flash.now[:alert] = 'Post create failed'
      render :new, status: :unprocessable_entity
    end
  end

  # Getting post by id
  def show
    @comments = @post.comments.includes(:user)

    @orders = %w[Ascending Descending]
    if params[:order].present? and params[:order] == "Ascending"
      @comments = @comments.order(created_at: :asc)
    else
      @comments = @comments.order(created_at: :desc)
    end

    @comments = @comments.page(params[:page]).per(5)
  end

  # Initiate editing a post, /post/:id/edit
  def edit; end

  # Updating a post
  def update
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

  def check_auth_user
    unless @post.user == current_user
      flash[:alert] = 'Unauthorized access.'
      redirect_to posts_path
    end
  end

  def post_params
    params.require(:post).permit(:title, :content, :published,
                                 :image, :address, :address_region,
                                 :address_province, :address_city, :address_barangay,
                                 category_ids: [])
  end
end