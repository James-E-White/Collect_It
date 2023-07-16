class ComicsController < ApplicationController
  def index
    @user = current_user 
    @comics = Comic.all
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

  def add_to_collection
    @comic = Comic.find(params[:id])
    current_user.comics << @comic
    redirect_to comics_path, notice: 'Comic added to your collection'
  end
end

#  def search
#     @facade = ComicsFacade.new(params[:id], params[:query])
#     if @facade.query_params.blank?
#       flash[:alert] = 'Error: You must provide a query'
#       redirect_to user_discover_comics_path(id: @facade.user_id)
#     else
#       @comics = @facade.comics_keyword
#       render 'comics/index'
#     end
#   end
