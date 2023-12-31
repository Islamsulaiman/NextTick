class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
  
    def index
      @categories = Category.all
    end
  
    def show
    end
  
    def new
      @category = Category.new
    end
  
    def edit
    end
  
    def create
      @category = Category.new(category_params)
  
      if @category.save
        flash[:success] = "Great! Your category has been created!"
        puts "new category"
        redirect_to @category
      else
        render :new
      end
    end
  
    def update
      if @category.update(category_params)
        redirect_to @category, notice: 'Category was successfully updated.'
      else
        flash.now[:error] = "Rats! Fix your mistakes, please."
        render :edit
      end
    end

    def destroy
      @category = Category.find(params[:id])
      
      if @category.projects.exists?
        flash[:alert] = "Cannot delete category with associated projects."
        puts "Dont delete category"
        redirect_to categories_path(@category)
      else
        @category.destroy
        redirect_to categories_path, notice: "Category was successfully destroyed."
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