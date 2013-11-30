class StaticPagesController < ApplicationController
  def home
    @livevideo = Livevideo.new if signed_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end
