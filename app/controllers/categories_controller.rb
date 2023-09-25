class CategoriesController < ApplicationController
  # Does this action before actually doing the main method indicated in only:
  before_action :set_category, only: [:edit, :update, :destroy]

  # @index, displays all categories
  def index
    @categories = Category.all
  end

  # initiating Category, opening a create form
  def new
    @category = Category.new
  end

  # creating a new category
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category created successfully"
      redirect_to categories_path
    else
      render :new
    end
  end

  # opening an edit form
  def edit; end

  # saving the updated category
  def update
    if @category.update(category_params)
      flash[:notice] = "Category updated successfully"
      redirect_to categories_path
    else
      render :edit
    end
  end

  # deleting a category
  def destroy
    @category.destroy
    flash[:notice] = "Category deleted successfully"
    redirect_to categories_path
  end

  private

  # returns the category data
  def set_category
    @category = Category.find(params[:id])
  end

  # parameters required
  def category_params
    params.require(:category).permit(:name)
  end

end
