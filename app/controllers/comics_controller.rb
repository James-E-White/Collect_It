class ComicsController < ApplicationController
  include Rails.application.routes.url_helpers
  def index
    @user = current_user
    @comics = Comic.all
    logger.debug @comics.inspect
    render 'index'
  end

  def discover
    @user = User.find(params[:id])
    @facade = ComicsFacade.new(@user.id, params[:query])
    @comics = @facade.comics_keyword
  end

  def search
    @comics = ComicsFacade.new(current_user.id, params[:query]).comics_keyword
    render 'index'
  end

  def show
    @facade = ComicDetailsFacade.new(params[:user_id], params[:id])
  end

  # def add_to_collection
  #   @comic = Comic.find_by(id: params[:id])
  #   if @comic
  #     @user = current_user
  #     @user.comics << @comic
  #     redirect_to '/comics', notice: 'Comic added to your collection'
  #   else
  #     redirect_to '/comics', alert: 'Comic not found'
  #   end
  # end
end
