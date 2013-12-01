class LivevideosController < ApplicationController
  before_action :signed_in_user
  require 'open-uri' 
  
  def create
    @livevideo = Livevideo.new(livevideo_params)
    @livevideo.url =  "http://10.187.248.226:8080/#" + newpass(10)
    url = "http://api.map.baidu.com/geocoder/v2/?address=%s&output=json&ak=AA50c6765a5a346c22348295adca7877&city=上海市" % ("交大闵行校区" + @livevideo.location)
    url_escape = URI::escape(url) 
    content = open(url_escape).read 
    content_parsed = JSON.parse(content)
    @livevideo.lng =  content_parsed["result"]["location"]["lng"]
    @livevideo.lat =  content_parsed["result"]["location"]["lat"]
    @livevideos = Livevideo.all
    if @livevideo.save
      flash[:success] = "Live Video Created Successful!"      
      redirect_to current_user
    else
      redirect_to current_user
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
