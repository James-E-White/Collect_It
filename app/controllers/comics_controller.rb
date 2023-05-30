class ComicsController < ApplicationController
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
