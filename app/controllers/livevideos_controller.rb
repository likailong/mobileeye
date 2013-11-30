class LivevideosController < ApplicationController
  before_action :signed_in_user

  def create
    @livevideo = Livevideo.new(livevideo_params)
    @livevideo.url =  "http://10.187.248.226:8080/#" + newpass(10)
    if @livevideo.save
      flash[:success] = "Live Video Created!"
      redirect_to current_user
    else
      render 'static_pages/home'
    end
  end

  def destroy
    Livevideo.find(params[:id]).destroy
    redirect_to current_user
  end

  private

    def livevideo_params
      params.require(:livevideo).permit(:information, :location, :url)
    end
    
    def newpass( len )
      chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
      newpass = ""
      1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
      return newpass
    end
end
