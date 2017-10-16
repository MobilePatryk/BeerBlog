class CategoriesController < ApplicationController
	before_action :set_category, only:[:show, :edit]
  def index
  	@categories = Category.paginate(page: params[:page],per_page: 5)
  end

  def new
  	@category = Category.new
  end

  def create
  	@category = Category.new(category_params)
  	if @category.save
  		flash[:success] = "Category was created successfully"
  		redirect_to categories_path
  	else
  		render 'new'
  	end

    def show
      @category = Category.find(params[:id])
      @category_articles = @category.beers.paginate(page: params[:page],per_page: 5)
    end


  end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
      @categories = Category.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name)
    end
end