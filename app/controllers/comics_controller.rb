class ComicsController < ApplicationController
  include Rails.application.routes.url_helpers
  def index
    @comics = Comic.all
  end

  def search
    @user = current_user
    @comics = ComicsFacade.new(@user.id, params[:query]).comics
    @comics.each { |comic| comic.id ||= SecureRandom.uuid }
    render 'index'
  end

  def add_to_collection
    @user = User.find(params[:user_id])
    @comic = Comic.find(params[:id])

    if @user && @comic
      @user.comics << @comic
      redirect_to user_comics_path(@user), notice: 'Comic added to your collection'
    else
      redirect_to comics_path, alert: 'Comic not found'
    end
  end
end
