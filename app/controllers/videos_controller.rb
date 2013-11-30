class VideosController < ApplicationController
  def new
    @video = Video.new
  end

  def create
    if params[:information].present?
      @videos = 
      @videos.information = params[:information]      
    end
    redirect_to user
  end

end
