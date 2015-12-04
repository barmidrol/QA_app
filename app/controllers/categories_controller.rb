class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user
  before_action :set_category, only: [:edit, :destroy, :update]

  def index
    @categories = Category.all
  end

  def create
    @category = Category.create(category_params)
    redirect_to categories_path, notice: 'Category has successfully been added!' if @category.save
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def destroy
    redirect_to categories_path if @category.destroy
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: 'Success!'
    end
  end

  private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end

end
