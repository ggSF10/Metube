class VideosController < ApplicationController
  #list all videos - GET /videos
  def index
  	@videos = Video.all
  end

  #show a single video - GET /videos/:id
  def show
  	@video = Video.find(params[:id])
  end

  #new video creation form - GET /videos/new
  def new
 		@video = current_user.videos.new
 		# this is identical to the following:
 		# @video = Video.new(author_id: current_user.id)
  end

  #create a new video - POST /videos
  def create
  	@video = current_user.videos.new(params)
		if @video.save
    	redirect_to @video
  	else
    	render :new
  	end
  end

  #edit video form - GET /videos/:id/edit
  def edit
  	@video = Video.find(params[:id])
  end

  #update an existing video - PUT /videos/:id
  def update
  	@video = Video.update(params)
		if @video.update
    	redirect_to @video
  	else
    	render :edit
  	end
  end

  #destroy an existing video - DELETE /videos/:id
  def destroy
  	Video.find(params[:id]).destroy
    redirect_to videos_path
  end

  private
	def video_params
  	params.require(:video).permit(:title, :url, :author_id)
	end
end
