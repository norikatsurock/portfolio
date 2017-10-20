class BlogsController < ApplicationController

  def index
  	@category_count = Blog.all
    @blogs = Blog.all.page(params[:page]).per(6)
    @categories = Category.all
    @topics = Topic.all
  end

  def category
    @category_count = Blog.all
    @categories = Category.all
    @topics = Topic.all
    category = Category.where(name: params[:name])
    @blog = Blog.where(category_id: category).page(params[:page]).per(6)
  end

  def show
    @category_count = Blog.all
    @blogs = Blog.all.order("created_at desc")
    @blog = Blog.find(params[:id])
    @categories = Category.all
    @blogcomment = Blogcomment.new
    @blogcomments = Blogcomment.where(blog_id: params[:id]).order("created_at desc").page(params[:page]).per(10)
    rank = Favorite.group(:blog_id).order('count(blog_id) desc').limit(5).pluck(:blog_id)
    @rank_top5 = rank.map{|id| Blog.find(id)}
  end

  def new
  	@blog = Blog.new
  end

  def create
  	@blog = Blog.new(blog_params)
    @blog.save
    redirect_to blogs_path
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.update(blog_params)
    redirect_to admin_blogs_path
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to admin_blogs_path
  end


 private

 	def blog_params
 		params.require(:blog).permit(:title, :body, :category_id, :image, :remove_image)
 	end

end
