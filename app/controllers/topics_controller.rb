class TopicsController < ApplicationController
	def index
		@topic = Topic.new
		@topics = Topic.all
	end

	def create
		@topic = Topic.new(topic_params)
		@topic.save
		redirect_to topics_path
	end


	 def edit
		@topic = Topic.find(params[:id])
		@topics = Topic.all
  	end

	 def update
    	@topic = Topic.find(params[:id])
    	@topic.update(topic_params)
    	redirect_to topics_path
    end

	def destroy
		@topic = Topic.find(params[:id])
		@topic.destroy
		redirect_to topics_path
	end



private
	def topic_params
 	   params.require(:topic).permit(:body)
 	end
end
