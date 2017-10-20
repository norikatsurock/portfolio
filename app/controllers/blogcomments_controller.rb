class BlogcommentsController < ApplicationController


def create
  @blog = Blog.find(params[:blog_id])
  @blogcomment = @blog.blogcomments.new(blogcomment_params)
  if @blogcomment.from.empty?
  	@blogcomment.from = "名無し"
  end
  @blogcomment.user_id = current_user.id
  @blogcomment.save
  redirect_to blog_path(@blog)
end

def destroy
	@blogcomment = Blogcomment.find(params[:id])
	@blogcomment.destroy
	redirect_to blog_path(params[:blog_id])
end

private

def blogcomment_params
  params.require(:blogcomment).permit(:user_id, :blog_id, :comment, :from)
end

end


