class CategoriesController < ApplicationController

	def index
		@category = Category.new
		@categories = Category.all
	end

	def create
		@category = Category.new(category_params)
		@category.save
		redirect_to categories_path
	end


	 def edit
		@category = Category.find(params[:id])
		@categories = Category.all
  	end

	 def update
    	@category = Category.find(params[:id])
    	@category.update(category_params)
    	redirect_to categories_path
    end

	def destroy
		@category = Category.find(params[:id])
		blog = Blog.where(category_id: @category)
		if blog.count == 0
			@category.destroy
			redirect_to categories_path
		else
			flash[:notice] = "※選択したカテゴリはブログ記事に使用されているため削除できませんでした"
			redirect_to categories_path
		end
	end



private
	def category_params
 	   params.require(:category).permit(:name)
 	end
end
